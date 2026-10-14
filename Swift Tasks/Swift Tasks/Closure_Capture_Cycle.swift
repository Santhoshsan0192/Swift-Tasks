class LeakyDownloader {
    let name: String
    var onFinish: (() -> Void)?

    init(name: String) {
        self.name = name
    }

    func start() {
        onFinish = {
            print("Finished \(self.name)")
        }
    }

    deinit {
        print("LeakyDownloader \(name) is deinitialized")
    }
}

class Downloader {
    let name: String
    var onFinish: (() -> Void)?

    init(name: String) {
        self.name = name
    }

    func start() {
        onFinish = { [weak self] in
            guard let self = self else { return }
            print("Finished \(self.name)")
        }
    }

    deinit {
        print("Downloader \(name) is deinitialized")
    }
}

func runStrongCapture() {
    var downloader: LeakyDownloader? = LeakyDownloader(name: "video.mp4")
    downloader?.start()
    downloader?.onFinish?()
    downloader = nil
    print("Strong capture: variable is nil and no deinit message appeared, the object leaked")
}

func runCaptureList() {
    var downloader: Downloader? = Downloader(name: "photo.png")
    downloader?.start()
    downloader?.onFinish?()
    downloader = nil
    print("Capture list: variable is nil and the deinit message appeared")
}

runStrongCapture()
print("")
runCaptureList()

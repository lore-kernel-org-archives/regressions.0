Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0078332B9A0
	for <regressions@lists.linux.dev>; Tue, 27 Jan 2026 18:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540347; cv=none; b=WWctV9PfOeQvujLlK0hWmfDBli/xy0NoE3cc6wE3PbS7Jnh5RU89Z01ZN7sqvXiMznmsmJ8bLQS81GIFljtTygRwRaYCwvQtHlSVZrEijzpceJ8p4rr56SDDLPc9uI8q0sgWT/U76zdDTj0QiRBK/RzV15r9ndn9Z1bbshtqSoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540347; c=relaxed/simple;
	bh=YQ9B+d9vz6BS8BXOQXWGIm2eeuGD5ifUA/NkFiqQWxY=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=bm699XtjTeWS+thKx7AROI0eO5yOR053pNQtQ2HNcn4l/2PmxbiI2WMxk1Z9dOQfOTU0xaOmtZe5bisXPC+h9gSzltUgHE5aGEzdqfOot2Xq57aUVWGmgJiHqqYDf8vqsL/PJzDSlwkqO/AZSp3Rb1HOAvVQDjEvDd6I+8jb3EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=IvquaP3H; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="IvquaP3H"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1233c155a42so8642542c88.1
        for <regressions@lists.linux.dev>; Tue, 27 Jan 2026 10:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1769540345; x=1770145145; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYJWuxALu6BfgLH1Tx1ISwIRVMv3VEfe+ER60Fmp5UA=;
        b=IvquaP3HyyawcjigwtE0E3RPm9rnetL78zKqCBjcphS8B3v2HFFMkNDdkkoSNbf4Sx
         w8S1m/SiQyiIYJ/jn6i/D+3s2tgN76tA3fWT7DLKTRlOnz+7+DsnHjmpyUulMzp2/smn
         E7ZGzYd0qq3oJFLO7XG9MHBl7NHxw/oazRlccB1VLB01JdVQRx8lDKD6b1/Yr6rTqo1y
         XkbumrcarclFVe/z46TfqSiQLyYKt2Is84y1DfAGliKAmgcZmygbQA44h3U5x36d5f0i
         DajGA4i+fjnwOo67CpGIT6SNQuIiy08tkIVoqokpConFVbCCxqCV91XihpG6Wjt6NCoQ
         UcDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540345; x=1770145145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vYJWuxALu6BfgLH1Tx1ISwIRVMv3VEfe+ER60Fmp5UA=;
        b=g2Khp5nd+t6TTmT+MtTE8i5SEoC+RPUE52QggfqutvCkl4OtLWCZNvaQWpR+1Gwi3B
         BJ2qZBOlllXMj2RhQd3QBwjm/2WVW/WMXZ5Lt2WOck1b+VauSwgc4tSPPkyjK6/ZHc7M
         QUjunadnPuGnkDZqq+GjYNGH4JiW0FNWWStF/WZqGu6P1Wsmg9J/nLnLTeT3Za5MFC4V
         mRhTDNf0RWw7leyeFe5rY95CHy9ifGojhtTQGbEDNwirmJRsuw9mmJ5ZRhjsljuWQGnG
         jR14mNEjctaMU+WwxGOZrv6VCNVD2zYzUNan4E36wqppISqXMT9VfLdfC9GPzyqTr+mP
         mfpQ==
X-Gm-Message-State: AOJu0YyV9wHUU9Nv8inrN450seWJMF31Oh8MdQlMrjUfGzf43Zl1qy5b
	40ayvknZcNjNuNgHOvnJZJMgvO8wG2l2K0bOdnDGHLjmTEmzTGiNpZO09/c/M1uniFY=
X-Gm-Gg: AZuq6aJMd4cW0vpLaXRAuCmtklHhq3TRBGOlBBqeJkgZGu3ZuRkS1zKEvhPYZY/z5iG
	sioXI0/EJww4drmwYHUcvknbQjT4AopnWBi63G+5pN/HoD4QQyWXpTwzAee9SDv1cz8rbGVrivR
	PZmUaoAUwdN+EPldy8p9APXnt/ppxjLmSQ7RXZnjhQaRm17ciPdX5mvrZrDsLM3OJFowQ66Cy71
	zovEvaNrNj8RJ2KdRDE8NMuwM3/OVMV/UzHZb6j1HXR8JuW93Uv4N/2zgjDcq2hhb2w5oknDNOr
	GTILUBGeq5q3RWu4eZKmL6blsjXPCcDUZ1Y5xYZrEH0xJbGEOrS0+q5xIzhChSPIzhx+ztDnk9D
	DP8xAwcv8+EVi2pVmoozAEHD9ueNJvsOsNu4ZES1GzewokS7OZoGwT9LeaW41NdrfsPnb0cFSxr
	C/R2uXM1nrlMLJ1nE=
X-Received: by 2002:a05:7300:72c5:b0:2ae:5f28:eafc with SMTP id 5a478bee46e88-2b78d9fda55mr1903976eec.27.1769540345277;
        Tue, 27 Jan 2026 10:59:05 -0800 (PST)
Received: from 22d5995788c3 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b79c38714dsm446099eec.2.2026.01.27.10.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:59:04 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) drivers/hwmon/cros_ec_hwmon.o:
 warning:
 objtool: cros_ec_hwmon_rea...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 27 Jan 2026 18:59:04 -0000
Message-ID: <176954034417.3309.9733468761811868537@22d5995788c3>





Hello,

New build issue found on next/master:

---
 drivers/hwmon/cros_ec_hwmon.o: warning: objtool: cros_ec_hwmon_read+0x7b: can't find jump dest instruction at .text+0xcbf in drivers/hwmon/cros_ec_hwmon.o (scripts/Makefile.build:287) [logspec:kbuild,kbuild.compiler.warning]
---

- dashboard: https://d.kernelci.org/i/maestro:6655b8550c87523fb99005c0e12cae13e112bffd
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  4f938c7d3b25d87b356af4106c2682caf8c835a2
- tags: next-20260127

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
drivers/hwmon/cros_ec_hwmon.o: warning: objtool: cros_ec_hwmon_read+0x7b: can't find jump dest instruction at .text+0xcbf

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-x86-next-697901771908a6300d99fbb8/.config
- dashboard: https://d.kernelci.org/build/maestro:697901771908a6300d99fbb8


#kernelci issue maestro:6655b8550c87523fb99005c0e12cae13e112bffd

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6CE45C18
	for <regressions@lists.linux.dev>; Wed,  5 Mar 2025 16:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741192400; cv=none; b=ndzZYwycz/fYevwzqE/PmEWQYZk5h6e2Ngdkq69R2Qm1nlpjJSse/9vdtespeTaODMmrfqAR9ri5lf+l92nds3unimF3i8N3vkNWdoNutlmYIUmbsWYbOOIhUAW0GdEKzH7PGh11YIy0pUci7n7tRPE1BXhLaM8d2h7S+PMU+ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741192400; c=relaxed/simple;
	bh=0kwY9FUG53nPfgHq+lB9nZ9aS4CCvz8fHFIvv5R3HGM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=LKXIa8spqUnYXsW8MFm6CGubRUzCMxIQ3y+2hxKTgV2xmLHkhPPYXeGkmDjtbdqmk+GT8sWi2BHIoWr/zsYkox7g+hXE7bayuXRLJ8wvsIoRQAsyBowciW4EFSSuX9psrcUyyLVJPYyzU/HCXZbN1BikE7/sLEYSKrkwOD3h+Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7kaGvh2; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7kaGvh2"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso1023409266b.1
        for <regressions@lists.linux.dev>; Wed, 05 Mar 2025 08:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741192397; x=1741797197; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JK4O2zf61Cn8wpdWW5Btx9mD0jmIMmD6EG+2ZAdy0IY=;
        b=R7kaGvh2CMlEGYYNFn24DVtkXf4kpHQMdUAbhpiGt4kzn7N66nOP6SMScPWM44gsc7
         M7EGSxD6ZypUrFIJb7W03UIIGXdzUP42/Q1N/G66kAtrB+ZuKQmKFRojTwOciCxmtd2d
         LXhNqMUN6xucxMjZh5F9eG1wn3i/tAN/rlfCP4r0/7CDPH1LfurTKkp0dkR+4gCYKIQD
         8hKTbdqC7n7Xlfzc0dmL0tb82dVJSXubSb2YzJlg/DeQaEvMWBtE7CleF/4L0AnRCNfc
         1Z0JusjUQwUjzpT223LU/P0XyRbbVJuLPIMvO3uqWTJEDKxqEORYO0WziwLW8hhG4PR2
         vgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741192397; x=1741797197;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JK4O2zf61Cn8wpdWW5Btx9mD0jmIMmD6EG+2ZAdy0IY=;
        b=W6UL73GC6QHHbdGnqF6Apxxy1xogATeArIPGpMBvU1a3RNj4NjMJgxO7Bj5/y8bT7z
         gl10X3Vnbyrrc4npIHeMQk+TVQ1n+6uK6g+ArOou2imcwAJTVU5JRylSgnYj7hTRJtqc
         GIUifZNKpoP/bPgJ4KLQzXcIsUv9Yb61oa0eTyC8NcM939Oa1MHMFkyem/NuTnMTqI6k
         ea5cHOqSYYGu839WFQ74vWEkuZFK5JkbOmNHy2cBZaJncd71q1LR+qXNj2eb/5lbWBWi
         6dPvrhaF50sVa0BHkb36kvFzZG+eIfk4ZbgmABTHqxAOn5pqoofH2QP8tAnTUH7UOLnx
         szOA==
X-Forwarded-Encrypted: i=1; AJvYcCV5ifG5OT+dfZQgFVkpKEyUsnp1iiWQEc04IiZXe9UaxcUWYJdN9f404B3IBxxDWXaEsU4F0UY9ySUP1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVVQPUVpvgCPr+2IvHtZm96oLYDe05pQIl6fWhlApvPl6zx5dA
	9z1kYA90/C7V+uaAwwbofKXjSbsjQG9JBRow9raP+GcR5/26Qqvb/R7U/Sn/YfhdRIacoXCdfVo
	TK7qaK9wUrykUl9mOnlZDTowH8rE=
X-Gm-Gg: ASbGncuMHPF6GzQ3hnRgmH6XGMb0xgTlObUDa0Mg2sL6SdDHXFwkeN4u9rTwwwPewNW
	0iMu5x92cB55mgXo4WTz58DuFXVb1QZLf1YOdZRJNs6SRV/jiVwqG/lhXJYDxjplVryNML/0kp7
	uMJPosuhXA5vrVuVNXArkgEIXR
X-Google-Smtp-Source: AGHT+IHSHs2TnczkyuMBUdfcfAqotKfdhX9hyFyaHZ1GF4bnrCI3S8DVGv8T1MW99UUFRzlGXjXZR9k54XKDo435ao0=
X-Received: by 2002:a17:906:dc8f:b0:abf:4bde:51b9 with SMTP id
 a640c23a62f3a-ac20dd078b9mr357854266b.35.1741192396600; Wed, 05 Mar 2025
 08:33:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?Q?Se=C3=AFfane_Idouchach?= <seifane53@gmail.com>
Date: Thu, 6 Mar 2025 00:32:59 +0800
X-Gm-Features: AQ5f1JozTIGBqPbsdq4tnmrTjBsGE02f-EjWfm9qmjROqDAlMIVVEXpdJMzEuzM
Message-ID: <CAMpRfLORiuJOgUmpmjgCC1LZC1Kp0KFzPGXd9KQZELtr35P+eQ@mail.gmail.com>
Subject: [REGRESSION] Long boot times due to USB enumeration
To: dirk.behme@de.bosch.com
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear all,

I am reporting what I believe to be regression due to
c0a40097f0bc81deafc15f9195d1fb54595cd6d0.

After this change I am experiencing long boot times on a setup that
has what seems like a bad usb.
The progress of the boot gets halted while retrying (and ultimately
failing) to enumerate the USB device and is only allowed to continue
after giving up enumerating the USB device.
On Arch Linux this manifests itself by a message from SystemD having a
wait job on journald. Journald starts just after the enumeration fails
with "unable to enumerate USB device".
This results in longer boot times on average 1 minute longer than
usual (usually around 10s).
No stable kernel before this change exhibits the issue all stable
kernels after this change exhibit the issue.

See the related USB messages attached below (these messages are
continuous and have not been snipped) :

[...]
[    9.640854] usb 1-9: device descriptor read/64, error -110
[   25.147505] usb 1-9: device descriptor read/64, error -110
[   25.650779] usb 1-9: new high-speed USB device number 5 using xhci_hcd
[   30.907482] usb 1-9: device descriptor read/64, error -110
[   46.480900] usb 1-9: device descriptor read/64, error -110
[   46.589883] usb usb1-port9: attempt power cycle
[   46.990815] usb 1-9: new high-speed USB device number 6 using xhci_hcd
[   51.791571] usb 1-9: Device not responding to setup address.
[   56.801594] usb 1-9: Device not responding to setup address.
[   57.010803] usb 1-9: device not accepting address 6, error -71
[   57.137485] usb 1-9: new high-speed USB device number 7 using xhci_hcd
[   61.937624] usb 1-9: Device not responding to setup address.
[   66.947485] usb 1-9: Device not responding to setup address.
[   67.154086] usb 1-9: device not accepting address 7, error -71
[   67.156426] usb usb1-port9: unable to enumerate USB device
[...]

This issue does not manifest in 44a45be57f85.
I am available to test any patches to address this on my system since
I understand this could be quite hard to replicate on any system.
I am available to provide more information if I am able or with
guidance to help troubleshoot the issue further.

Wishing you all a good day.

#regzbot introduced: c0a40097f0bc81deafc15f9195d1fb54595cd6d0

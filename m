Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C444217C8D
	for <regressions@lists.linux.dev>; Fri, 12 Jan 2024 18:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PJkUMNPG"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5534180f0e9so193a12.1
        for <regressions@lists.linux.dev>; Fri, 12 Jan 2024 10:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705082486; x=1705687286; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XxcXCQP3+9Bv+ZGDo4IurQCR5mkoBqs8qSMmpsQJKCY=;
        b=PJkUMNPGRJ8MufbCLhXnB3YQidzPBCWuh+EmIpoVBtZx14QhBp/SijMST4z1WDIuHg
         xn9KjRMn469AdI7nPzDbgsJLfw7X28IYNu1TYmbggN4ccmOhdRkQGGW5XaX8utC4/wzG
         Pnk4/KrcfhhCgMAI7FPNjBjaD3p6J214Gi+ozYXmM+TOKrw4xYLHPrS828TEPQWT5hzD
         yZG21U+Z3VciilXo1L7DlyvjrSudwDeZKFNXOJ8Ble43ZgpsQDUM+luShuQ3v+atVeGR
         IZvgSytIIHe0BdXPAaSMQy9EZc6y8RQxe+TOpINMerKmi8zyFMwngfgmNC0FEgoDS1+H
         W1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705082486; x=1705687286;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XxcXCQP3+9Bv+ZGDo4IurQCR5mkoBqs8qSMmpsQJKCY=;
        b=ogKLlgs3IybhAt4976+l+KLGHdqlNFZ6UKV4C1zAkbzEh3kFKtrG7jmtp4tDEmIktR
         bQo0tOtcrZmB1UQJMVHV/oOKU7Oon39rn6uCiEtbtIA67EH9JSznra2cciCqNsfqv+Gu
         0ChGDzPmNyooqAf8IQsaKvmYGJzKaI04UyK6l9eitePLVxhwLafKYfYutA6CkR92ewhG
         2K+RK74oQGd4UhLJcQU+cIoyde+H1YSxKA1w8H5syGxZm324+695ziruJr9ebA89Frrm
         M7klPptwB3lBwJx4uOgnGrjuC9v6hwR0cn3Tuc1Adw/oG8GrB7KseExoDFFwdgvw7yeb
         gHOw==
X-Gm-Message-State: AOJu0YzxKy4EjlmzBb1nKD0y7ryUlBA8z0XGeI8b9S2rYEXuWASPqz/o
	6q13vplntcV4nJqNwf4EGKlpktnrwHZYkgTBXbTDXHuhIDXj
X-Google-Smtp-Source: AGHT+IF37WrheBgs7vZkD4LAZbqDI+dAMM/O+eQ2FkKngINtsaFMvdv46HN03Hdih6jdNpEuUF5/JOa1qC5ybtJoa2w=
X-Received: by 2002:a05:6402:40d1:b0:558:7f0f:aa70 with SMTP id
 z17-20020a05640240d100b005587f0faa70mr384479edb.5.1705082485852; Fri, 12 Jan
 2024 10:01:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Jeffery Miller <jefferymiller@google.com>
Date: Fri, 12 Jan 2024 12:01:14 -0600
Message-ID: <CAAzPG9MU2PfTk2Yn+spJqH6mLVsG1p6L6vhJ4LFG+aiojnN6HQ@mail.gmail.com>
Subject: [REGRESSION] In v5.15.146 an ax88179_178a USB ethernet adapter causes crashes
To: stable@vger.kernel.org
Cc: Linux kernel regressions list <regressions@lists.linux.dev>, justinpopo6@gmail.com, kuba@kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For 5.15 attempting to use an ax88179_178a adapter "0b95:1790 ASIX
Electronics Corp. AX88179 Gigabit Ethernet"
started causing crashes.
This did not reproduce in the 6.6 kernel.

The crashes were narrowed down to the following two commits brought
into v5.15.146:

commit d63fafd6cc28 ("net: usb: ax88179_178a: avoid failed operations
when device is disconnected")
commit f860413aa00c ("net: usb: ax88179_178a: wol optimizations")

Those two use an uninitialized pointer `dev->driver_priv`.

In later kernels this pointer is initialized in commit 2bcbd3d8a7b4
("net: usb: ax88179_178a: move priv to driver_priv").

Picking in the two following commits fixed the issue for me on 5.15:
commit 9718f9ce5b86 ("net: usb: ax88179_178a: remove redundant init code")
commit 2bcbd3d8a7b4 ("net: usb: ax88179_178a: move priv to driver_priv")

The commit 9718f9ce5b86 ("net: usb: ax88179_178a: remove redundant
init code") was required for
the fix to apply cleanly.

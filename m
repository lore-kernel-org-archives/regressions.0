Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BA372
	for <regressions@lists.linux.dev>; Fri,  6 Aug 2021 22:22:02 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id x3so11575451qkl.6
        for <regressions@lists.linux.dev>; Fri, 06 Aug 2021 15:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=V/ll2hpvidiYtw0djf/vWIHsO9PJqm5uVgFvBi4DmwE=;
        b=RYfK1JKHX4+Cfhgugn37nYevLMI3U5tI2fM9CI7IOK31aUsh/juQJpFK88mXSXUD41
         cKajlKkMPVuhu0lk8RYTDu5X5YivfYIYn9DKpKNmsQJLPhFVZv8WXK8lgmX3XZKRgnur
         sjA5xkITF1wIMqcmdb0HF1yVMg+6fghDk9obAOQxbeocXooED7RpzTvCpCsEEWC/PMnz
         yIIvr0mmMwZEpV6rvgyt0Q4qSNqSIv+cFvHK9obSVIyGLK2iILaHIfev9NM4JpcQXlXh
         0vCXjOJwmTxUlFPh1oJVYbYiTtkF9gqh4Lt9TDf4R43Y3qEAELrMK6G4eE9VE5LsThep
         Bnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:from:subject:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=V/ll2hpvidiYtw0djf/vWIHsO9PJqm5uVgFvBi4DmwE=;
        b=VShRi9SAJe3uVpAMa7e5B+thpUF/86l0TJQzzFSSGf0oU/iUDIzWQOLVUarzMx5NGk
         ROZm6y2VMdPQ1sjGPFCU3yU5clv3/tsFaWQgxLzYFxw4AGjT785O5LJWwt+tp5qJcmXy
         ccmG8hJgTbgiBJOjqzegWONgdOyq5aJORw7w6IaCVr1NTsEdZEwOcTSyR/meQcRaKbdj
         GkrFZAN2Vod/6YdPGr8UYhb8cqIUvNq43REHrN5Wh9zAJj02h0cfMXtJErMeZaJqT3uW
         QQmbpRBQbF/KGpvwg+NoyxzUHXN5JXp66jkUyoVHglBWIh71L0JkERGaqhU+gAQrxeuR
         +NuQ==
X-Gm-Message-State: AOAM532+hfA9FSqTovsWJe+s4N9jyki5cna37E3tZNi9Sb5yFbfZFk+9
	UAr+HeiN94duTPUaztXQrPA=
X-Google-Smtp-Source: ABdhPJyZc7LTpzoHnbKj9LoixypfTP0+DpWcFrxRaPEc8Zu4Rd/vM+zK93JNzhaZF5cN572f0mRdJA==
X-Received: by 2002:ae9:ef0b:: with SMTP id d11mr8635595qkg.442.1628288521284;
        Fri, 06 Aug 2021 15:22:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q26sm290132qki.120.2021.08.06.15.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 15:22:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To: regressions@lists.linux.dev
Cc: stable <stable@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Marcel Holtmann <marcel@holtmann.org>
From: Guenter Roeck <linux@roeck-us.net>
Subject: regression: Bluetooth interface broken on systems with Mediatek CPU
Message-ID: <a9cd03da-b816-eed3-7e77-d539924cbe88@roeck-us.net>
Date: Fri, 6 Aug 2021 15:21:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

[ Greg asked me to submit a report to regressions@, so here it is. ]

The following error was observed on Chromebooks with MT8183 CPU
(ASUS Chromebook Detachable CM3, HP Chromebook 11a, and others):

[  224.735198] Bluetooth: qca_setup() hci0: setting up ROME/QCA6390
[  225.205024] Bluetooth: qca_read_soc_version() hci0: QCA Product ID   :0x00000008
[  225.205040] Bluetooth: qca_read_soc_version() hci0: QCA SOC Version  :0x00000044
[  225.205045] Bluetooth: qca_read_soc_version() hci0: QCA ROM Version  :0x00000302
[  225.205049] Bluetooth: qca_read_soc_version() hci0: QCA Patch Version:0x000003e8
[  225.205055] Bluetooth: qca_uart_setup() hci0: QCA controller version 0x00440302
[  225.205061] Bluetooth: qca_download_firmware() hci0: QCA Downloading qca/rampatch_00440302.bin
[  227.252653] Bluetooth: hci_cmd_timeout() hci0: command 0xfc00 tx timeout
...
[  223.604971] Bluetooth: qca_recv() hci0: Frame reassembly failed (-84)
[  223.605027] Bluetooth: qca_recv() hci0: Frame reassembly failed (-84)
(repeated several times)
...

The Bluetooth interface on those Chromebooks can not be enabled.

Bisect suggests that upstream commit 0ea9fd001a14 ("Bluetooth: Shutdown
controller after workqueues are flushed or cancelled") introduced the problem.
Reverting it fixes the problem.

The problem was also reported at [1] on a Mediatek Pumpkin board.

As of this writing, the problem is still present in the upstream kernel
as well as in all stable releases which include commit 0ea9fd001a14.

Thanks,
Guenter

---
[1] https://lkml.org/lkml/2021/7/28/569

Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69F4173
	for <regressions@lists.linux.dev>; Thu,  9 Dec 2021 23:36:32 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id z8so11360800ljz.9
        for <regressions@lists.linux.dev>; Thu, 09 Dec 2021 15:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=F8boScU7PkpLy5I01OwUQvLADtvtEkn8BzfdBWDEDcY=;
        b=q4XxCaU4czP1BeRuh/U1Da9cRVNH1Rq3z1/WNTaj88K+UGWfKa6yV85JcVeNQSqaUt
         iKvkwx79/DlRJSvMww4HroTv+tB1pfH9v4lywRhkVtdGMiGFj1v6bKcXZg1hyENS3arn
         pc6YBECRfRyPLzGpMNwZjiQAo9gMuzTsp0PyqFJoyd70IicIqMwfGTJXqpRcqX/4itWK
         5/bC/V1QSTB5UPnZO5VUVI7YmL0FoAklls7qpB3RmKBsQuPmwnX9izQoYQnX2JMKcZ12
         sF1807fmH/fTi9t6HlbWhNssLYh8+GtWAP8Mv8BcFxCJggSPD2rjmSJ88QpCc4FT4St3
         nFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=F8boScU7PkpLy5I01OwUQvLADtvtEkn8BzfdBWDEDcY=;
        b=Xrimt2SA9F6hLa8fK5un8XjLmtA7a+r9Le1S7/D9rHrZcts0GzmjBpVGQCdDOYztIb
         RT4m1xX1yO3O24JlwL2N8iAErO5ctX78y4+sRw2SSWg0OKSQ7s7e/URHaeGQ/WbNtKnP
         mcr2/6daRyCjBVZZZ4e9I3GpMhT/l4iHoxHqjz2F+76SP5KQhNAeVFb8YdGhktKNaVpC
         cgTP5lpbYoQgradZJQpyne24vddcNgbmnjC74xIhm0oABFqWHU6erdghk12ZafUxCo+3
         EZjREHqdQMh+W0PG4ydyLNyVpGIQnV3Syim25oEwwJIJSGtFjgeVhq7qD0QK4+tga7jd
         yw7w==
X-Gm-Message-State: AOAM531f+vGYWTLNmcaORMcRTm24yvqKo0N/utjGJVa3jsaH62wj10j5
	4L/lqHSb16xY0Jx1QrZmTuB5yZtUmDQrnCF0sXk=
X-Google-Smtp-Source: ABdhPJx2AU7IRNZHdt1Ln3B0zqHP/c6Gv3XpXJyJv4OKtRNw/C2tcCV0Xz0ZnCQClkwMAXzkDBg++JinGDj3OM01SNk=
X-Received: by 2002:a2e:6e15:: with SMTP id j21mr9488073ljc.195.1639092990871;
 Thu, 09 Dec 2021 15:36:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: coldolt <andypalmadi@gmail.com>
Date: Fri, 10 Dec 2021 01:36:28 +0200
Message-ID: <CAJvGw+AJ5dHSb50RtJHnjbhMVQa+rJgYznFV4t-iaO0qx+W-jw@mail.gmail.com>
Subject: [REGRESSION] Bluetooth not working on 5.15+ since "Bluetooth: Move
 shutdown callback before flushing tx and rx queue"
To: marcel@holtmann.org, kai.heng.feng@canonical.com, tedd.an@intel.com, 
	linux-bluetooth@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

After a restart, bluetooth doesn't work since commit 0ea53674d07f
"Bluetooth: Move shutdown callback before flushing tx and rx queue"

bluetoothctl doesn't list any controllers and I get the following in
dmesg | grep -i bluetooth

[    2.634812] Bluetooth: Core ver 2.22
[    2.634843] NET: Registered PF_BLUETOOTH protocol family
[    2.634845] Bluetooth: HCI device and connection manager initialized
[    2.634850] Bluetooth: HCI socket layer initialized
[    2.634853] Bluetooth: L2CAP socket layer initialized
[    2.634858] Bluetooth: SCO socket layer initialized
[    4.077788] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    4.077794] Bluetooth: BNEP filters: protocol multicast
[    4.077799] Bluetooth: BNEP socket layer initialized
[    4.078219] random: bluetoothd: uninitialized urandom read (4 bytes read)
[    4.852835] Bluetooth: hci0: Reading Intel version command failed (-110)
[    4.852838] Bluetooth: hci0: command 0xfc05 tx timeout

However, it works after a cold start or after putting the computer to sleep.

Before 83f2dafe2a62 "Bluetooth: btintel: Refactoring setup routine for
legacy ROM sku", it always works after a restart, but from that commit
up until before 0ea53674d07f it either works or doesn't work after a
restart depending on if before restart it was working or not, meaning
it stays working or stays not working.

Also on the first restart from before 83f2dafe2a62 into 0ea53674d07f
or later it works, but then restarting again into 0ea53674d07f or
later it no longer works. So it seems that 0ea53674d07f and later puts
the bluetooth in a nonworking state if you restart from it, but before
83f2dafe2a62 it puts it back into a working state at startup, and in
between it doesn't do either, i.e. it stays the way it was.

I have a Dell Latitude E5550 laptop with an Intel 7265 wifi/bluetooth
card REV=0x210 firmware version 29.4063824552.0 7265D-29. I'm on Arch
Linux, the problem is still there on 5.16-rc4.

Here is a thread on the Arch Linux forums with several people with the
same problem, for some of them it got fixed with a kernel update or by
reloading modules, but not for everybody, including me
https://bbs.archlinux.org/viewtopic.php?id=271459

#regzbot introduced 0ea53674d07f

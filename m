Received: from mail-yx2-f20.google.com (mail-yx2-f20.google.com [74.125.224.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810C43B0AE8
	for <regressions@lists.linux.dev>; Fri, 18 Sep 2026 09:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.148
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789723319; cv=pass; b=Es+p6SRouT5aph+HsDx8O/Nt034T9t3tF3VXzrD9MVLJUjh4N753JTtE3hZo3tOgeZNmmW0Xl6r/Uj996PsCGUkmveMsfzByxGFG9rrfU4Txf6fbTCE9XfMsqIJhHdxoRWdx+htk/LJNb4LuxhroMQ9t9Aanh6w69ZNds5kGaWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789723319; c=relaxed/simple;
	bh=BhrP26kMKnmlFoYZEuYscjOjg4wJ/VgVaV4UizLkvC4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=twZH47pcfTjuDQ8EubXwgVkPkNTgZhoXi0FwM5xG9eu5jGhjbMuOLTQg1wM3EDJvzatBo0WQVFtwmwZO36aFzpZqsXDgkk4GTwzOvZitfSCsuNYqhd+a2x+9CXhkdy8P0MFMiPLTWy1Kixoe8Xil9UsVvhKOEbZjebV7GcDpF7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQOsQOYz; arc=pass smtp.client-ip=74.125.224.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQOsQOYz"
Received: by mail-yx2-f20.google.com with SMTP id 956f58d0204a3-66e4ab20a32so548612d50.2
        for <regressions@lists.linux.dev>; Fri, 18 Sep 2026 02:21:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789723316; cv=none;
        d=google.com; s=arc-20260327;
        b=VPMzegJbghX0bFzVty65J1Y7EJc1N43pHjlzEcOllp2kggRxSVvK9tsn/VFl/JT5vf
         wsWkk7/CasD5TLC04Xts25a3RUCMHSHr0j8unM/CtSmoel59eMjzXZg//RyU+fdsjegN
         LysYHIP99pxTRHV7jvuTqQx23bzIxBkGvu7CFglYJKwDvQSjf+oPRiwvWO5uIu30Rpzv
         2/vZdCC4x3HIUfQpezfr5gnTEyDuHijLbfSQGsht+njUuuUuU56njw9Pwk11Ty3N6/W7
         VOTcPbuKlLsqPEcGEsAbfDVAmc5bb8LAEw3Z86Gu8eaiXZBMc3PC0VUqvpltFUL1dSwF
         eRUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=nD/GJPiV1XjkeTL6SxQvTBbRy3ScObJoMI/2OsxN2yM=;
        fh=8EQmFwqEujBqyPfCETGsbd2vf5VJRCqddKRfhUw5/w4=;
        b=by16jWY9hJGrSCk9sXo8XGpoVa2U+/cNDhLf4xRau+EiHficpE8sXns7iQuwGsoHAA
         W4Ncrcd2lPNjyzBPe/Bs272gspS1m9pcuBpLQaUUcCtF7+lmLd4lci8M0Yh48NqFVX/E
         EZEcwmry3cn6SxOFL6E8SWEhjVYxRJqZQcTksNbizZelOL+5K7aN21gJu2ByLwwWV878
         Q3qU2rkvldyqpdo4V3xpz/ahGY8Mj5OxNxCbjRLUspnSbVpSXP5G5rTWhzOhq9L6N4M1
         EJx+MP4yzGj1+OHkWbSEIjapAl8I7fZp02MYlq/h0LU4Y6ZFCowiULUn3E4E9vW9fxkT
         G8HQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789723316; x=1790328116; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nD/GJPiV1XjkeTL6SxQvTBbRy3ScObJoMI/2OsxN2yM=;
        b=VQOsQOYzvoBKDIwoGF1yEpJPwamINZnJKXaaFRi271Z3QGhHDqHCMgQ9uLuCJt1zYU
         0KcPi65oCt7cI20zuaejr3RmaNcnGBchewygLXkCZMMWPkxRL4JVMR97nnAZSUW6gTv2
         1YJI+ZZNlKE+GxCyjQzuqvqXILL7S4Ll9czxJ+GIyWngtKyJG0kBR+G8lebbjUfBVYKf
         ofooMTkD2zrUGTG4XfAX9quBDU9r4WfP8OcnMHpOL7A1NTE1m3hAvzSVYYzPoxD9uQFH
         BAUisEl1huITOE3WetRIYv/u5jr+utRsf+HZSujU3kIw93oQ8bmFJx6UJ9RU3EXcWlF/
         cbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723316; x=1790328116;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nD/GJPiV1XjkeTL6SxQvTBbRy3ScObJoMI/2OsxN2yM=;
        b=WBYtsZSi/wQuRO0xHETjgT71L57RxPu2z3FmT4VmCi/vUyeEMEz1GlV7Fcz0AvdHYX
         0y+eox0GApxdY+FHZ7tdObaBfoNDkALGOjDxhY0fAaAyeIQv3zykOvWdD7mWM+R+2PXG
         9BbBE25pqDr0kzrhX5cvXgoBZuO5IyEMGaA/N6YQjftUVUKZiEKh6O/z7QX441V7Vr5v
         NfIH1/D9jD/FrxbNHNhoyxpaNfHWqSE8XxSnz6PF+H7qbFi5ywljyvb6XvzZRvMSeui2
         v0XzQ5m+JmWaPKWjq3l4ndGBmrqBMJagd+dVlivTtl6AWRrLB9Kld2m0XxwIhGdM1zQl
         shkA==
X-Gm-Message-State: AFuF++nka39dPwY4/mDyyoVxz2FxFtlb7392Dc++Icxt8eBupVl6i618
	R+afmD81JRKBPYpfFRbZXPbMYF2AP7V2coCh+gceKOeTTY2IwMqf+etm0La4lobdERffLO9D3vA
	8QQ4azPZb2FafBC2pMkohSC6vm9YXjic=
X-Gm-Gg: AYBFou24pt9T0KI6JITKoy7orh6tzcMFbA3vNF4WbKeJ6Bo2FEcw9N0N+ng7hqX/RDC
	xFgawWyxAC8rUlYt240j6LrA5FiiAkuEDZNGXubqB+jkiZ0yoVr8hneJtA4LS63RhfKqqwiTaEU
	XAIEVWBQrFYQYNHS1nnztE+c3k0kPfOV9RP1AyY8TFXZeB4BFRFSZ/7T8fhBIcExEAwjyBqqlsH
	CCWXc3LXUKmo2voIqSgxbreZG8k3iRkpw/UT/i5MbI220YtdUzWNNrWOt8ekPeurUl1VLhGzVlT
	DT40hvx3ETMalFtq+cE8CRmFiWs6v7/qUntJywK/VXl3+QgD5hXhzQMq8vH37X4FI6aityrZN6k
	2lv3ofZAaeDamSjDYR3wRpVXonpaOONjFEx/cgLOennoiBU7z2nT6ribD2g7M0Di+fH7rOJlYpr
	a6ilZ8A6rPNn2FSdLwnKnEaTPtTrojcg8aOBSA98z55QoPOrKVJ1Q=
X-Received: by 2002:a05:690e:4891:20b0:66f:c24c:984f with SMTP id
 956f58d0204a3-6717fcb43cemr423149d50.25.1789723316357; Fri, 18 Sep 2026
 02:21:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Andy Tsvetinskiy <andrew.tsvetinskiy@gmail.com>
Date: Fri, 18 Sep 2026 12:21:26 +0300
X-Gm-Features: AcwNN1U9bBz4oqrqnKAj-Sb9WJNzj8Zwpjj3kE4gcfnFog-8WS186ojw8MfEYhA
Message-ID: <CAE4bxw+ofDFVx0aTHqCrzns9oP1CRQDm_wzeyHPeMBYOhSpcuA@mail.gmail.com>
Subject: [REGRESSION] RTL8761BU 0bda:a728: removing BROKEN_EXT_SCAN fixes
 0x200c timeout
To: linux-bluetooth+owner@vger.kernel.org
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

   This report concerns USB ID 0bda:a728, not 0bda:8771.

   I have a Realtek RTL8761BUV USB Bluetooth adapter:

   - USB ID: 0bda:a728
   - Product: Bluetooth 5.4 Radio
   - Firmware: rtl_bt/rtl8761bu_fw.bin
   - Firmware version: 0xdfc6d922
   - Running kernel: 6.18.51-1-lts
   - Distribution: Arch Linux

   With the stock btusb driver, Bluetooth repeatedly failed with:

       Bluetooth: hci0: command 0x200c tx timeout
       Bluetooth: hci0: Opcode 0x200c failed: -110
       Bluetooth: hci0: Unable to disable scanning: -110
       Bluetooth: hci0: Resetting usb device.
       usb 1-2.2: reset full-speed USB device
       Bluetooth: hci0: unexpected event for opcode 0x200c

   The firmware was loaded successfully:

       Bluetooth: hci0: RTL: loading rtl_bt/rtl8761bu_fw.bin
       Bluetooth: hci0: RTL: loading rtl_bt/rtl8761bu_config.bin
       Bluetooth: hci0: RTL: fw version 0xdfc6d922

   The USB autosuspend setting was not the cause:

       /sys/bus/usb/devices/1-2.2/power/autosuspend: -1

   The current upstream fix ca0583c24661
   ("Bluetooth: btusb: limit RTL8761B BROKEN_EXT_SCAN quirk to 0bda:a728")
   is already present in my kernel. It sets BTUSB_BROKEN_EXT_SCAN for 0bda:a728.

   I tested the opposite change locally in drivers/bluetooth/btusb.c:

       - { USB_DEVICE(0x0bda, 0xa728), .driver_info = BTUSB_REALTEK |
       -                    BTUSB_BROKEN_EXT_SCAN },
       + { USB_DEVICE(0x0bda, 0xa728), .driver_info = BTUSB_REALTEK },

   After rebuilding and reloading the btusb module:

       systemctl stop bluetooth
       modprobe -r btusb
       modprobe btusb
       systemctl start bluetooth

   Bluetooth scanning worked normally. A 20-second scan completed with:

       Discovery started
       Discovering: yes

   After loading the patched module, no new occurrences of the
following messages appeared:

       Opcode 0x200c failed: -110
       Opcode 0x2042 failed
       command tx timeout
       Unable to disable scanning
       Resetting usb device

   The patched driver is currently loaded and Bluetooth remains operational.

   This suggests that different RTL8761BUV devices or firmware
revisions using USB ID 0bda:a728 may require different scan quirks. On
my device, keeping BTUSB_BROKEN_EXT_SCAN causes the legacy 0x200c
command to
 time out, while removing the quirk fixes the issue.

   Relevant upstream reports:

   https://linux-regtracking.leemhuis.info/regzbot/regression/lore/20260822141115.58815-1-kserwus@gmail.com/

   https://bugzilla.redhat.com/show_bug.cgi?id=2521504

   https://lkml.iu.edu/2608.2/12212.html

   Please let me know if more logs, a full patch, or additional
testing is needed.

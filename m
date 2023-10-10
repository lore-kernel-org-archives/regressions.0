Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DCFEAFF
	for <regressions@lists.linux.dev>; Tue, 10 Oct 2023 09:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlmuMo4t"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-68bed2c786eso3937689b3a.0
        for <regressions@lists.linux.dev>; Tue, 10 Oct 2023 02:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696928683; x=1697533483; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2RXE7fyLfD3qzF7sApsWnRY+f5dq9bXtB3kEGmnfPA=;
        b=SlmuMo4tk0RYi9uJT8ajuH4j6vYINsvd72L2D/pd6RaOA+n/vHgnsnuoqUmoJrrk7v
         v0V3BmER8lx/BLR6GPCZkMYXwx3w+m9Ns04YwUXw4HidbR4ur68Bm9O7B6w/TtJDuT7L
         ioFKIM49KyciZZRgj3JzbejYvQmSuTaKk3Xtp+SYugA7Dc66ZDetZyV6OwPKW8b87BqU
         J1vOpf26bJicWxN88y1FnOvuoSisEt4mhfZT6RiDW9ektKzz75SL236aIgBHnOskSZ4C
         jyZFMhf3w1cqLL58OVknX8Xv2uUa7ocbZawDXZpUqAOFU70buqItYwZNpT9PTjN3jiMw
         ikzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696928683; x=1697533483;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J2RXE7fyLfD3qzF7sApsWnRY+f5dq9bXtB3kEGmnfPA=;
        b=Ua9cvnE9i7n31tdZqV7uRUWN1BvBd1pdBjSCqP2aIDMZLWRqRjJ5OaqDy0SATJ7DRr
         wINFCNdD1nHJP/Fyb98+LmOd7JOCFmZsr83mDhUI80riGSYlclkNvxZrOzo2AVwSx9hN
         jPixMbXv7+uIBPx30L/Sy2r4QfxnXUxy42yC62EgPmnzJJKa85/GkM4pyDUjIhalqe2J
         kJPMGX+z81g/gNcPA24BBe6PenELdUtfum8dM/k2lsAwYkIhSGO/YKHT2H1cdiP+iq6C
         ND7OkXqyXYxlDcj8L4ti459rAVCNNGsXr2p0dmy6++zq1s8BNHtECrsT4yeMfaXuhcsZ
         Pdgw==
X-Gm-Message-State: AOJu0YySuEqH6oIlgCzUjMVplO11KFBvQkNSzoJUH4VSR+TU44Vfckki
	nIdc85u7rptU/5x4+tXvLLo=
X-Google-Smtp-Source: AGHT+IEhcp8R/FIAFbq7UdZjUFdRU8O5IedvU7V229puFGOvbTBRQjqRn9NJ5K7zxFYXulEXk+KUhQ==
X-Received: by 2002:a05:6a00:369a:b0:69f:b6c4:51e0 with SMTP id dw26-20020a056a00369a00b0069fb6c451e0mr5180154pfb.1.1696928683511;
        Tue, 10 Oct 2023 02:04:43 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id u13-20020a63470d000000b0056b27af8715sm9323866pga.43.2023.10.10.02.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 02:04:43 -0700 (PDT)
Message-ID: <83b5114c-1ff8-4251-a4ef-8c0e7614f74b@gmail.com>
Date: Tue, 10 Oct 2023 16:04:38 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Wireless <linux-wireless@vger.kernel.org>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Kalle Valo <kvalo@kernel.org>,
 Victor <victormingueza@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: rtw89_8852be wifi disconnects and needs to be restarted
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> Hi,
> 
>   I got a new laptop HP 445 G9 that comes with the Realtek RTL8852BE. The wifi is able to connect to internet briefly and then it disconnects from the network, the device is not available any longer until I restart the laptop.
> 
>  I'm using Arch and cloned the linux 6.2 and installed this version, although not maintained anymore, it works fine and is stable, wifi never disconnects, but newer versions of the kernel seem to have the issue mentioned above. Below are some logs from the kernel 6.5
> 
> Oct 03 21:29:14 ryzen14 kernel: rtw89_8852be 0000:02:00.0: loaded firmware rtw89/rtw8852b_fw-1.bin
> Oct 03 21:29:14 ryzen14 kernel: rtw89_8852be 0000:02:00.0: enabling device (0000 -> 0003)
> Oct 03 21:29:14 ryzen14 kernel: rtw89_8852be 0000:02:00.0: Firmware version 0.29.29.1, cmd version 0, type 5
> Oct 03 21:29:14 ryzen14 kernel: rtw89_8852be 0000:02:00.0: Firmware version 0.29.29.1, cmd version 0, type 3
> Oct 03 21:29:14 ryzen14 kernel: rtw89_8852be 0000:02:00.0: chip rfe_type is 1
> Oct 03 21:29:14 ryzen14 NetworkManager[823]: <info>  [1696321754.6290] rfkill0: found Wi-Fi radio killswitch (at /sys/devices/pci0000:00/0000:00:01.3/0000:02:00.0/ieee80211/phy0/rfkill0) (driver rtw89_8852be)
> Oct 03 21:30:41 ryzen14 kernel: rtw89_8852be 0000:02:00.0: failed to pre-release fwcmd
> Oct 03 21:30:41 ryzen14 kernel: rtw89_8852be 0000:02:00.0: read rf busy swsi
> Oct 03 21:30:41 ryzen14 kernel: rtw89_8852be 0000:02:00.0: read rf busy swsi
> Oct 03 21:30:41 ryzen14 kernel: rtw89_8852be 0000:02:00.0: timed out to flush pci txch: 0
> Oct 03 21:30:41 ryzen14 kernel: rtw89_8852be 0000:02:00.0: timed out to flush pci txch: 1
> Oct 03 21:30:41 ryzen14 kernel: rtw89_8852be 0000:02:00.0: timed out to flush pci txch: 2
> Oct 03 21:30:41 ryzen14 kernel: rtw89_8852be 0000:02:00.0: timed out to flush pci txch: 3
> Oct 03 21:30:41 ryzen14 kernel: rtw89_8852be 0000:02:00.0: timed out to flush pci txch: 8
> Oct 03 21:30:41 ryzen14 kernel: rtw89_8852be 0000:02:00.0: timed out to flush pci txch: 9
> Oct 03 21:30:41 ryzen14 kernel: rtw89_8852be 0000:02:00.0: timed out to flush pci txch: 0
> Oct 03 21:30:41 ryzen14 kernel: rtw89_8852be 0000:02:00.0: timed out to flush pci txch: 1
> Oct 03 21:30:41 ryzen14 kernel: rtw89_8852be 0000:02:00.0: timed out to flush pci txch: 2
> Oct 03 21:30:41 ryzen14 kernel: rtw89_8852be 0000:02:00.0: timed out to flush pci txch: 3
> Oct 03 21:30:41 ryzen14 kernel: rtw89_8852be 0000:02:00.0: timed out to flush pci txch: 8
> Oct 03 21:30:41 ryzen14 kernel: rtw89_8852be 0000:02:00.0: timed out to flush pci txch: 9
> Oct 03 21:30:42 ryzen14 kernel: rtw89_8852be 0000:02:00.0: FW does not process h2c registers
> Oct 03 21:30:42 ryzen14 kernel: rtw89_8852be 0000:02:00.0: read rf busy swsi
> Oct 03 21:30:42 ryzen14 kernel: rtw89_8852be 0000:02:00.0: read rf busy swsi
> Oct 03 21:30:42 ryzen14 kernel: rtw89_8852be 0000:02:00.0: write rf busy swsi
> Oct 03 21:30:42 ryzen14 kernel: rtw89_8852be 0000:02:00.0: write rf busy swsi
> Oct 03 21:30:42 ryzen14 kernel: rtw89_8852be 0000:02:00.0: read rf busy swsi
> ....
> Oct 03 21:30:56 ryzen14 kernel: rtw89_8852be 0000:02:00.0: write rf busy swsi
> Oct 03 21:30:56 ryzen14 kernel: rtw89_8852be 0000:02:00.0: FW does not process h2c registers
> Oct 03 21:30:56 ryzen14 kernel: rtw89_8852be 0000:02:00.0: HW scan failed with status: -110
> Oct 03 21:30:57 ryzen14 kernel: rtw89_8852be 0000:02:00.0: Update probe request failed
> Oct 03 21:30:58 ryzen14 kernel: rtw89_8852be 0000:02:00.0: FW does not process h2c registers
> Oct 03 21:30:58 ryzen14 kernel: rtw89_8852be 0000:02:00.0: read rf busy swsi
> Oct 03 21:30:58 ryzen14 kernel: rtw89_8852be 0000:02:00.0: read rf busy swsi
> ...
> Oct 03 21:30:58 ryzen14 kernel: rtw89_8852be 0000:02:00.0: read rf busy swsi
> Oct 03 21:30:58 ryzen14 kernel: rtw89_8852be 0000:02:00.0: write rf busy swsi
> Oct 03 21:30:58 ryzen14 kernel: rtw89_8852be 0000:02:00.0: FW does not process h2c registers
> Oct 03 21:30:58 ryzen14 kernel: rtw89_8852be 0000:02:00.0: HW scan failed with status: -110
> Oct 03 21:30:58 ryzen14 kernel: rtw89_8852be 0000:02:00.0: xtal si not ready(W): offset=90 val=10 mask=10
> Oct 03 21:30:58 ryzen14 kernel: rtw89_8852be 0000:02:00.0: xtal si not ready(W): offset=90 val=10 mask=10
> Oct 03 21:30:58 ryzen14 kernel: rtw89_8852be 0000:02:00.0: mac init fail, ret:-110
> Oct 03 21:30:58 ryzen14 kernel: rtw89_8852be 0000:02:00.0: xtal si not ready(W): offset=90 val=10 mask=10
> Oct 03 21:30:59 ryzen14 kernel: rtw89_8852be 0000:02:00.0: xtal si not ready(W): offset=90 val=10 mask=10
> Oct 03 21:30:59 ryzen14 kernel: rtw89_8852be 0000:02:00.0: mac init fail, ret:-110
> 
> More details about the wireless device based on HP specification:
> 
> Realtek RTL8852BE 802.11ax (2x2) Wi-Fi and Bluetooth 5.2 combo
> Qualcomm Fast Connect 6900 Wi-Fi 6E 802.11ax (2x2) and Bluetooth 5.2 combo
> 
> Hopefully those details are useful, let me know if I can provide any further information.

Then the reporter (Cc'ed) had found the workaround:

> Hi all,
> 
>   After some more testing I found a workaround for now to run any modern kernel (> 6.2). I disabled some of the features for low power mode on the pci device and it seems stable now while running 6.5.
> 
>   I created a file in modprobe.d to disable the power saving settings:
> 
> /etc/modprobe.d/20-wifi.conf
> options rtw89_pci disable_aspm_l1ss=y disable_aspm_l1=y
> options rtw89_core disable_ps_mode=y
> 
>   Probably there are some issues with the driver when in power saving mode, which is the default behavior. Hopefully the new info brings some light for fixing the drivers.
> 
> Thanks,

See Bugzilla for the full thread.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: v6.2..v6.5 https://bugzilla.kernel.org/show_bug.cgi?id=217978
#regzbot title: rtw89_8852be wifi disconnects in power saving mode

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217978

-- 
An old man doll... just what I always wanted! - Clara

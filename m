Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FD51EB21
	for <regressions@lists.linux.dev>; Fri,  6 Dec 2024 13:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733491984; cv=none; b=XcnmD4QRaYIn3/lXp5ZymDYv+KX0l8jDLLs/XQcZcOjRejC//a2gweYRB2hcwqAmaN8O/ApyheXlgGQk4y7Zjs/EIoyNtZC5NU2L5vwya9RgiBh9ZTkfzAWPk3937sEuBO6xPRyryuGh0Hv7iEXYFhYEcziUkZJM1a81QrvjScQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733491984; c=relaxed/simple;
	bh=vLP1tsrLrBn5UbOMsUTvwsyw2ImcPlXlTvJJHcQ03AA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=SquCsVFBsB/VkpNQugzc/dLTgfb/CG9Vlj9g6svumuzY6HeX5ZhF2/WsfUXDWwKteUbrolNk6rIxDCGQxY1/XUJtRPpADfe+pRwjJSzzCbhasXI4sI+XGMz0on+Ta1uL+hwWpk1qdV2ffP3vWeNMNFiGCOqAdEH5zR3hAROfX0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hd0b42ts; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hd0b42ts"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so20102101fa.3
        for <regressions@lists.linux.dev>; Fri, 06 Dec 2024 05:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733491981; x=1734096781; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSrFoYGsGUHyZVE4nB9VSg0Tyg06nqGrBpnSKe/0vDQ=;
        b=hd0b42tsad9RjAsfrDGhDnPGsNK1C+wrIDfv6fc1Cwvmy+JzhfHIT0NVc2OK07MFhn
         fKhBBoLYIpveAh4uG7WJNCl7jt5Z6eLQ78txd8INC86CnaLH7np6lr254npYNLOHLVHH
         M3a1VdON64KNuIMV0e2fjZao9q7pG3plC01+Dardtk1eVkuuEZAk4pfovDm7OR2mK6dC
         uglvJbTbAaci4giLnRWeDpxPd2WnlAkbKggNadmGXHulqQFO9kCtriVnVCHaLLtzBk0a
         A8LKQgW/xb2ZaghBvu6GpoGjpm+lnY92PeeHiE+hMLqtZCHrlYPBjzx4Uf6L4lceVj0X
         bb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733491981; x=1734096781;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GSrFoYGsGUHyZVE4nB9VSg0Tyg06nqGrBpnSKe/0vDQ=;
        b=MasUF8AIS3MhY6+hSJ6foRuEWMvRBHYhPiQGW+GLmEH5Mu5JkhyC7figtWRgN3htuN
         kRZBk1Dhw6Z2dkwWo/kq5DFxrJr+Gpat+pBbbjkgjyTT/SRwuxprRXxoloASpgKCuH4N
         Q8rW8sOLALoAjuOq1yswvaFlLC0pC8EdiNVCIbnhq0NBubThgAk3W/DY04KjJhzKNOl3
         BPqvsNwYs48X2w7avXNuqeFurHcDbOpll4R21mK2vgUyrNvzfjolFMfORzYl0eccOR69
         PtSqIBk3IbvL7X5plmKH77KKpbEIkSn8df+BTERugt1TYMrn7OmQ8fXX0Ov7XklJN3pD
         87tw==
X-Gm-Message-State: AOJu0YxwAfL2QjE5mu4JhPv+4tL17rJIOpTe6Y1ayAVrHI7EpxJZ8jDo
	/mtsIdMHrFgo4RT9SzEUlcUBWZTHsR6ZQvInT44biyVraVrRxsOV
X-Gm-Gg: ASbGncv1R6O/KpNxjNYOl6uaUSHFElt036yw2PLybJSd0rFcQ/yDgwLOlbSvHNX2Pnv
	l8b/h6lcrH9+hxDFoDtieTcq5lKrmbBzm07euxXiKCkjPcXAvkw0C9TzqHkbpcEmWwQE5t1r4eV
	PRuxhO4rvTqUJUMgNzx5iGUsF05S37v7fM2g5JstwG4U/F036DW8NRpA97YCQJeX5/Lzb3S2xmv
	ot+lwJ8IQpk1aJbzlcSUbAvTNlDSGVhqZaZyhH1bYBjiQcDDpsF
X-Google-Smtp-Source: AGHT+IFN6Nih4BPUS9vHqQD9JB0tRflwPG1VssIbKhDZvAyx2rQwUJqNR0m9Anlg6c9QjKZZHtkGjw==
X-Received: by 2002:a05:651c:901:b0:2fb:4b0d:9092 with SMTP id 38308e7fff4ca-3002f89e98dmr14923121fa.1.1733491980769;
        Fri, 06 Dec 2024 05:33:00 -0800 (PST)
Received: from [192.168.0.205] ([45.152.72.7])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30038254e47sm794911fa.61.2024.12.06.05.32.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 05:33:00 -0800 (PST)
Message-ID: <33bfcda8-3d3d-46b9-84f0-44e0e9f44230@gmail.com>
Date: Fri, 6 Dec 2024 15:33:07 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yura Strilets <yurastr100@gmail.com>
Subject: [REGRESSION][BISECTED] asus-wmi driver fails on my laptop
To: platform-driver-x86@vger.kernel.org
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

After upgrading from 6.11 to 6.12 a bunch of Fn+Fx buttons(touchpad, 
mic, kb backlight, my asus) stopped working and the 
/sys/(...)/asus::kbd_backlight interface is missing, which, considering 
the dmesg, looks like an asus-wmi driver issue.

I've been able to bisect the issue to the commit 
[b012170fed282151f7ba8988a347670c299f5ab3] "platform/x86: asus-wmi: Fix 
thermal profile initialization"

Additionally, here's some maybe-helpful information:
my laptop's model -- ASUS Zenbook UX3402VA
linux distro -- Arch Linux
.config for bisection -- was taken from /proc/config.gz at 6.12.1 arch 
kernel(attached in [1]) and missing options are default
dmesg logs -- The "grep asus" parts of both good and bad scenarios can 
be seen below and full logs are at [2] and [3]

== bad.log ==
[    3.664546] asus_wmi: ASUS WMI generic driver loaded
[    3.713358] asus_wmi: Initialization: 0x1
[    3.714126] asus_wmi: SFUN value: 0x21
[    3.714131] asus-nb-wmi asus-nb-wmi: Detected ATK, not ASUSWMI, use DSTS
[    3.757420] asus_wmi: Failed to set throttle thermal policy (retval): 0x0
[    3.757425] asus_wmi: Failed to set default thermal profile
[    3.757429] asus-nb-wmi asus-nb-wmi: probe with driver asus-nb-wmi 
failed with error -5
== end ==

== good.log ==
[    4.557898] asus_wmi: ASUS WMI generic driver loaded
[    4.776587] asus_wmi: Initialization: 0x1
[    4.777253] asus_wmi: SFUN value: 0x21
[    4.777256] asus-nb-wmi asus-nb-wmi: Detected ATK, not ASUSWMI, use DSTS
[    4.777258] asus-nb-wmi asus-nb-wmi: Detected ATK, enable event queue
[    4.805497] input: Asus WMI hotkeys as 
/devices/platform/asus-nb-wmi/input/input15
== end ==

[1] .config - https://pastebin.com/raw/3nDSV8Sm
[2] bad.log - https://pastebin.com/raw/fvR5Sjzt
[3] good.log - https://pastebin.com/raw/EazfLAWA

Thanks,
Yurii

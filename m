Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DAE329375
	for <regressions@lists.linux.dev>; Tue, 18 Nov 2025 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763459991; cv=none; b=OevoK46J4wr4pMHyfFBh+ExpBJVjgqXGE8vGxeYEip4vmGoFksk/xkQmYXaJ8MTXLREEYIyd/FkKK5TDONLDhUeo+I4OKRYwsuJ3sLdqG6HOB3DxK2vcSlxKFA9vlN0MXo5W8NIIV9mdxa60lqphksSqzuoFVhnbsBvo3ToRykw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763459991; c=relaxed/simple;
	bh=3OTjsyF8jzv5/5B8GX+VKvfXggixdgyd2+Q102JeQ8o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aBNDSDdNsxF2EbhugiRPH0qOi89Epq3ix4N1B2dzA+cVuQ+lRzliDGATVLghxGZyrmRomCm7xZrYDEU9CKI8Umfi2kftksVo4TO2P+xJS3UImbuDCidbh0IYOeT76IrhMqRsldQvqB8Nhf9j5ZvhDMd06FijmFMLJPdoiUo/vcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDXBF9Gs; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDXBF9Gs"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so9188515a12.1
        for <regressions@lists.linux.dev>; Tue, 18 Nov 2025 01:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763459988; x=1764064788; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZYnCm/sXxbVHIqtj0TWym4GM93F9lRgfmerGHcbL1Y=;
        b=gDXBF9GsJojO+fB4C7iiY+fdzaa01VS3PHCeL8cbUu4q0MtqnSj4Oy2OU24ybYkJeZ
         lEiLIWNTg2dNCKiY+eVJgZqj6QreRTkl9PAAaTRq6ON50YPkhG5za2RsMIL+ccbniBJX
         nO//L+dowhxE3XtAMltPb7b3T7S385xsDhZ6XVGFvYg8MWYUcnoHnFlxnFBBIWjmOlfh
         9/GHkXKHekMMkfM6ffZTbeSLelowBe4GjkUp+MpL/uTmypQEF9Zhtqoozl6LzuBDS6DW
         PthuRoAAKUUQOali3DC818skH3j+NJuTUvehYa6HrmM8KNpGh+8385PCewl1GM41b1ih
         YD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763459988; x=1764064788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ZYnCm/sXxbVHIqtj0TWym4GM93F9lRgfmerGHcbL1Y=;
        b=KDGc5OMoIjVT75NcmbBz+4LoWGTwWa190ybbNk/xtrTUpbZpRnihZ1bwvFgwp9avjA
         X25qRZPw6qL4wHUhHpaGpl43KOA+OoIhqP0fFaPYOZFOtTxeVal4Zxq3BeA/NZeka9Eo
         J3p3A86g91QWkNeGidUlKTfD0J6stq59E9oZgqEhah9Cnt/QjhcZQcpvnaJKorMbhxd+
         M6AFj6F+eDE6ljiM0TenPj6tMLgnV7StE2XZzu1/qSCQnL/ZCHHuPK0ybSkDkV8dV0ms
         j1fDeflJ0SQZPlMdMML6SugivKuV1tjpNNpsuIjAlkE5Fnj4zN/MggcBVwFXtX5+vtrf
         gehQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMnNiPq/iNpxGbWKzUeimQdYbEpzMUnivlDvlcfhnfraNTZtOv0bqsA/JfCXiyU7NEBPCsx6IWdtAq8w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3iNG5fYVHqAanwUC0Wd/Kw84/OgRb9/tzCgXWdU4ed/wXfHb7
	KYre6JpXChpa7z0lGOWnLCpmLk4ICoXLbVGuXh0uEeIHrS9uEdAt0xiR
X-Gm-Gg: ASbGncsHvn65S0iVrKRebNBBDalxAA8d6qToibz9zqeqmBlOr5TVMo5S26WTwTkut/i
	uj13yrRWGtGIhJnZG3UxAUQ0wRPF8AkAn0a1MLnw+mhF1B2vDHJpcDk1F4vAMAcuOwfJdhxtDfI
	w13lGqpm4e0/vkcsb+1LVp0CumzJLmdupIzr2DvkKWyiMXSUfmhkWooWHusaQVNGC+LDoQXifeK
	h+AQS++3rx83q4xEEuTQ++7B8xLJZGGcXSwAqBiV31KZe3J8QB4KuiapT40lPbnHMCNlczzE/8T
	HoQXLSt2CZaoee81I4xhATVx/WvtNHJJtT3wLpBverq8QXntKSn1F96B/H9OEHieytsYMOak7I6
	Yzn5lCBQdm1dM+KoFH4+5q1ZdxDNsXyVGuVvNG5GxCZzBHnXzK0gsXAtc6RW943v7XU4yjdrwh7
	wrPlNYyLzUbJiNqJIabxk3p4o=
X-Google-Smtp-Source: AGHT+IH27uoFNutlapD0gNjviVN2jZZutdx/ofuInMm4gjmLoJom6smGVoJQwrQi+8LFI4RuRsaYlA==
X-Received: by 2002:a17:907:94ca:b0:b73:709e:a20a with SMTP id a640c23a62f3a-b73709ea300mr1368869066b.47.1763459987333;
        Tue, 18 Nov 2025 01:59:47 -0800 (PST)
Received: from foxbook (bhd138.neoplus.adsl.tpnet.pl. [83.28.93.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80a06sm1299820966b.38.2025.11.18.01.59.46
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 18 Nov 2025 01:59:46 -0800 (PST)
Date: Tue, 18 Nov 2025 10:59:29 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Forest <forestix@gaga.casa>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Alan Stern <stern@rowland.harvard.edu>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Stefan Eichenberger
 <stefan.eichenberger@toradex.com>, Pawel Laszczak <pawell@cadence.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION][BISECTED] usb: hub: total system freeze after
 running adb
Message-ID: <20251118105929.330f0042.michal.pecio@gmail.com>
In-Reply-To: <qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net>
References: <qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 17 Nov 2025 12:18:54 -0800, Forest wrote:
> #regzbot introduced 8f5b7e2bec1c
> 
> Running adb (android debug bridge) commands causes the entire system to
> freeze some time later.
> 
> The freeze usually occurs within two hours of running adb, but not always.
> Stopping adb's persistent background process with `adb kill-server` seems to
> avoid the freeze. (However, this is not always possible, since the system
> sometimes freezes just a few seconds after adb is launched.)
> 
> It occurs even when no android devices are connected to the system.

Hi,

If this is caused by running some demon without much hardware connected
(besides hubs, I guess), I wonder if it might be useful to run strace on
that thing to see what it is even doing to trigger this crash.

> - No messages are written to dmesg or syslog.
> - Virtual console switching no longer works.
> - SysRq key commands no longer work, as far as I can tell.
> - Whatever was on the display remains intact.
> - Any already-playing audio enters a short loop, as though the
>   motherboard's sound device is playing from a ring buffer that
>   no longer gets updated.

How can you know nothing is logged if the machine becomes unresponsive?
For such occasions I keep a PCIe card with a serial port to get logs.
Maybe xHCI debug capability could work too (?), but I've never tried.

Regards,
Michal

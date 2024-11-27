Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3AF200132
	for <regressions@lists.linux.dev>; Wed, 27 Nov 2024 23:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732749276; cv=none; b=P+hBLJXX8HJadRHPWBvDYiG35X13TzTjGCfCn0NxjiTfFtV+t5B/vPt3EYeJUXXTNxHpEkthIr3s8GUzFxPyZpE2ktzuXf2XLTgZ6CIn1AIyHwwtiHzjG02lraWJk3rkbRbKFEuKkmmPSPNPnoHUAV4oMdMZhdwfacPJIHfQbwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732749276; c=relaxed/simple;
	bh=6Ltkmyej5Wke/PPGa8ytesCUrUFYIIc0zVEnWqiEWaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tywd0CYn2zVZkms/0iAHtEH/Idlw0/N36x7AS7g1pBmzcmnembxY9nazErfyA2dvKV0P33BH/FyMVCf5UToHGZVxSQLSFjKGmCvOeIj0hR+Z63Lx3yiYjehAmabrp6jQAoVZZ1g3rOIyhrKhkuK7IXhfEHHvvlYd7gwjnJyzRvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fapgvfCu; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fapgvfCu"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2142214abd2so1803255ad.0
        for <regressions@lists.linux.dev>; Wed, 27 Nov 2024 15:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732749273; x=1733354073; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Qbsfa3oGMzg1U/98CAfEMqAXTtrg3Szco6BJfPedmc=;
        b=fapgvfCuiqtv/RxOFdxEWREkp8sKbw40t59RfrPfSH2J5UuM5tLkO4RgYqWHDEWajs
         cLc/JA7mds+5070wUKLRt3ksWYXm3usWeeWVx4zS7O/B7cRo9SgBmLvv9avwNNAV0OjK
         cuxpiU+tinAjfsBfz01WHjS09AYE3R56lpqUu1ojH5VdIOMwrz4s/3asI5Wj9yGSdVP5
         Df8oxyk4OjzRSMajnC3yDAHqiDIogc7l6Yh1KykRlsiLxji0Bg+SOgiWqdugiFuHo5vP
         BmJX7x2RpGTs5/pLSjfQhuwusZobcA+y/mxo9Fb7YYPm+0PN2Q+7JR9g1zTtwyxjsGTt
         6h+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732749273; x=1733354073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Qbsfa3oGMzg1U/98CAfEMqAXTtrg3Szco6BJfPedmc=;
        b=eUserf+B4Q8uIwkCv2OJbCmOwe3huyJlY18OLL2tbRB1g6ZLkbhGPpdc/FhydAyqfr
         xvKYI2q91tDjm0kle+gEfjT3cf7SNVkF82/01RC2Z+L5PPwZ6biWRVFzRybC1Fszkdda
         q7mj0Oa96zgCu3CSvBd3nv8K1d/qePPnr3hLj+dJVAHy1eP7Q9GY0pgsDri1ePmr2u0+
         Dn7b8rIwWCsZR8AuEea0jhY32supWg2AkATODz0fbnY4TLJpolByORA+HtO8IARuqkKg
         1gLZVS6eo34j2I/l5STOOspnAUzhp/ElEs2Mqum+Vpbwi4nov/ukxd/RzI/i+dE65biy
         8fHA==
X-Forwarded-Encrypted: i=1; AJvYcCXNa49YYwZxH3fm9bV5tnK22A2+Y76FdoLF1qn41RLo1E6K3LhGfyqJNUjJTocFoztfzLpM5dHAw5Wv9w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr6dgDuklj968avxFooOdWByFxTXsVuWSdyGTGAIEJPssH3984
	OSp2qD9+pPrrgicj2/bbtRtFATl3o15idmzoUFOdWa9Xh6lcpOaR
X-Gm-Gg: ASbGncuPggXp3Ealpwg8W3JJKZT639OTx54EwTwXlAzUdhm7c5C3yqEtpg5iEYKbR1V
	RbtKqFKdO32imouz67KScwl4h1pn3pcDKBoB2nWbLrsRwdb9LCs115WW+Vdz9VpvlOdyOAY5/WU
	wIvr8PxQRQxxmusJ70sWV00MeewH0BfWOmFDTwN4fU1Uvilyg30zLEmpNw7bSkLWVdkzY0o65zg
	KWA5Sqcy/MrvFinc/46j2JsLtrPzehZsocES+GCGBF/pkDAZwIaIp39WuQNOv9BPji3SN7q+h2u
	8gtm6MwR
X-Google-Smtp-Source: AGHT+IG42zwk9rVSv3JinSJ7jGPo3cY4n7KHciWkVFVdIkqCjPRr7Vl0KdkjQqjmAh8XeOcmAt858A==
X-Received: by 2002:a17:902:dac4:b0:212:1abb:fe75 with SMTP id d9443c01a7336-21501f64128mr57312355ad.54.1732749273617;
        Wed, 27 Nov 2024 15:14:33 -0800 (PST)
Received: from amdora.. (c-76-146-136-228.hsd1.wa.comcast.net. [76.146.136.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215219c49ebsm903255ad.252.2024.11.27.15.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 15:14:33 -0800 (PST)
From: John Glotzer <jglotzer@gmail.com>
To: regressions@leemhuis.info
Cc: Aaron.Hou@mediatek.com,
	Chris.Lu@mediatek.com,
	Deren.Wu@mediatek.com,
	Hao.Qin@mediatek.com,
	Sean.Wang@mediatek.com,
	johan.hedberg@gmail.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	luiz.dentz@gmail.com,
	marc.payne@mdpsys.co.uk,
	marcel@holtmann.org,
	regressions@lists.linux.dev,
	steve.lee@mediatek.com,
	tiwai@suse.de
Subject: [REGRESSION] bluetooth: mt7921: Crash on Resume From Suspend And Hibernate
Date: Wed, 27 Nov 2024 15:14:32 -0800
Message-ID: <20241127231432.8112-1-jglotzer@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <643d8055-5a9f-4f5b-865b-830d33651dfe@leemhuis.info>
References: <643d8055-5a9f-4f5b-865b-830d33651dfe@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I've been following this thread since hitting this issue on my AMD Ryzen 5 7600.

People have reported being able to mitigate by either turning off Bluetooth in system settings
or by using a systemd sleep script like the one below (this is the approach I've taken,
it works fine.)

cat /usr/lib/systemd/system-sleep/sleep-fix.sh
#!/usr/bin/env bash
case ${1} in
    pre)
    rfkill block all
    echo "Killed wifi/bluetooth"
    ;;
    post)
    rfkill unblock all
    echo "Started wifi/bluetooth"
    ;;
esac

In following the related email threads it seems that this particular email thread has
not had any activity since 10/21/2024. Now the focus seems to be on firmware download which
in my admittedly non-expert opinion seems to be not clearly related.

There are multiple reports of this issue on various user forums (Fedora, Arch, Redhat, others)
but it seems that we've lost focus on the kernel side on addressing this regression.

Thanks all.

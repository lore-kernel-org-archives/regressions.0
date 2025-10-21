Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2116332EA2
	for <regressions@lists.linux.dev>; Tue, 21 Oct 2025 12:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051296; cv=none; b=kW5ihYHHjobKZmJlKNLqCPur6hDUzL17acr/5ORrI3Th+RYtxxZCJ/LE6DFX1SBubRkAeI1UW+VbFAIJ+8jG7yZ0e/Yg1uLGD8MswJrVH7wpOBpNQtmAc2xJEPZGS1uVlLAIGQIs+qo7dxx81gZbT6TVRJnCMbIixmry//mXXRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051296; c=relaxed/simple;
	bh=HnKWHFVv0AYcRhz/eFjf/zIYKDTs92rkesrrKB0d0N4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RcI1zWIHD2A5b6m2RSacWFS/VSz5h0vjPtxmo032kU41zqHt71aVXdK86tRaf54v00StQ6YAuHmzNnlX9ACf5xKoTkl2sg4cr0cSYrhrqNSIzaiIH9+HyT1vcDmhTBXAC68R42eyF5OKAemoKYjd/p9uZLZpfWIqSq1cE7y2/Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A64hmL53; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A64hmL53"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b4aed12cea3so936508166b.1
        for <regressions@lists.linux.dev>; Tue, 21 Oct 2025 05:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761051293; x=1761656093; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhiJSrqs+stuku6ihyFAqxGodPlxM4DaxRFdGGu9usI=;
        b=A64hmL53dKLIjbzi+yOqwqLT9XVxWiWvB/CHuJNcaaLmYxGqrfco8BcOQ7gx1mJSlM
         GiK1MEwMUe+qrI94SKn+tmg3NTQ7SwXFcrw/gO9esjRQb5QNHZT7M41AgoKSmTkYhrUm
         vrknGiswunyuNeZ3BK64erScXhTlvnXqlX5qdPxw5b9VdF/VyUXsq3lAPLkGDR72RkUL
         9Zk8l1Zm6Jk4bz/pRb0jn4nhmPkWPLkaoMP99zffc1C+1TAyZGG4oxcd6+/SCu/dlsfk
         hwAylDrDSdRrTUTtrOFyjl7y/IXfRbx+Dz04mL+b6uV/6/rgk69qBgq6UqALNeuo0EHW
         l4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761051293; x=1761656093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DhiJSrqs+stuku6ihyFAqxGodPlxM4DaxRFdGGu9usI=;
        b=qkCgd38Y83ClxJ4/4K4uKjPonM7DOoZ5ZXqCaqCi/GO96f1A23Y9c59EXbNqCtuLMA
         VDe2/6d0gHq+OxGEhV+Jb2dqA03vSySHND+ot3osrRXWHlmfW1VLPYDIDP04+RriLfoF
         wdeNiuFHKj3RXT4CfU3vusb8wOGWbfsWADBLY66ZtOqDCZnQy4GPSndXS5W12PN5NsR+
         g7rsc3y1IPcsRnRNeuAf1M4++sLsVhYDZJ5Z7+QLa6T7TMYP4Yv6UAyweASmnNRyz+ca
         S4uX556A8NO7Gayu2JhCoD4ASLdHTdi8jOYiiOXQITKCTBBXSKNjKAQ6HCwYm4RshSO6
         twNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNhEOuqCF28u9X98kl2dqDirEUqAJIIcMOPui3CB6cv3Enh2suOSYYQtF2+Kxp9TQnNyTY8owcuMUbkA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCVdrqjRcMyP7o2IxLE9DzaUo9vvoi2Mzdl/5ue4l5KquX5+5J
	hQKtlu/wDJ/nXQQd9tpjFkKDGdJarenEivEuOntFnVSbAP1j1qgCIMhK
X-Gm-Gg: ASbGncuvxitE2idir7mOI4jtT50SW4/27ZLq3A8d/z0ry+BVKv40X9XyLd2n2V1Oizz
	deYEanNyW8sNRE4zVuIfWFprgjGfmastxRxAh+kXb6ocmM1gZ0tSqlbv9TvjIJbrFuSNZlwQL1g
	jKw9DYfbTwK0GAK/Vz8yJkXTcjmnhZjRae0Evp0AUwhLEBekjDCV4GQ2q0MZvUbncJXPvFBW2n5
	9YCM5F/XU+BvuUosP7FhTUYmdOYMT/Xq3pe7U1Y+kCUjD17ZA5fgrxQx0N8WabnVAInLf1WS/Br
	4tsl+8S6HOV5Bkxq9U+er+ZLgn5t5DkAyDFgOOB0PJJ+r7VJQ5Bfdc1Z5k3/7QPFKsYugk/DwYz
	Ib+FTchO8EB2fPKjBq1nYRqrumuZqpoS6auI1OajRfTGOjcE+4FY+9D8JOf+unioC7WX8q4+1dd
	5YyAZagI9QdbGf
X-Google-Smtp-Source: AGHT+IED4rIk2aydZFVCa0pw6CF5ZaOerW1OexhJSr/S8sqp1U7+sBg1/U17BT8+Mtilu1EqrR7DUw==
X-Received: by 2002:a17:907:c09:b0:b3d:5088:213d with SMTP id a640c23a62f3a-b6474b36a25mr1655258266b.42.1761051292676;
        Tue, 21 Oct 2025 05:54:52 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b65ebc48eedsm1065996066b.79.2025.10.21.05.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 05:54:52 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: chris.feng@mediatek.com
Cc: chetan.kumar@mediatek.com,
	hua.yang@mediatek.com,
	len.brown@intel.com,
	liang.lu@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	pavel@ucw.cz,
	rafael@kernel.org,
	stable@kernel.org,
	ting.wang@mediatek.com,
	"regressions" <regressions@lists.linux.dev>,
	"DellClientKernel" <Dell.Client.Kernel@dell.com>,
	"Mario Limonciello" <mario.limonciello@amd.com>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Subject: [REGRESSION][BISECTED] "Wakeup event detected during hibernation" on Dell Precision 7780 (was "[PATCH v4] PM: hibernate: Avoid missing wakeup events during hibernation")
Date: Tue, 21 Oct 2025 15:54:46 +0300
Message-ID: <20251021125446.4384-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20231213083251.186935-1-chris.feng@mediatek.com>
References: <20231213083251.186935-1-chris.feng@mediatek.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Chris Feng <chris.feng@mediatek.com>:
> Wakeup events that occur in the hibernation process's
> hibernation_platform_enter() cannot wake up the system. Although the
> current hibernation framework will execute part of the recovery process
> after a wakeup event occurs, it ultimately performs a shutdown operation
> because the system does not check the return value of
> hibernation_platform_enter(). In short, if a wakeup event occurs before
> putting the system into the final low-power state, it will be missed.
> 
> To solve this problem, check the return value of
> hibernation_platform_enter(). When it returns -EAGAIN or -EBUSY (indicate
> the occurrence of a wakeup event), execute the hibernation recovery
> process, discard the previously saved image, and ultimately return to the
> working state.

#regzbot introduced: 0c4cae1bc00d31c78858c184ede351baea232bdb

Hibernation doesn't work on my laptop.

My laptop is Dell Precision 7780.

Hibernation starts, then aborts. dmesg contains:

[   28.283320] PM: hibernation: Wakeup event detected during hibernation, rolling back.

I did bisect. The bug reproduces starting with 0c4cae1bc00d.

The bug still reproduces on v6.18-rc2.

Note: there is another problem with PM on my laptop, which is tracked here:
https://lore.kernel.org/all/197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com/ .

So I always revert 1796f808e4bb in my kernels.

But this doesn't prevent this hibernation bug.

In other words, this hibernation bug still happens on v6.18-rc2 even
with 1796f808e4bb reverted.

Steps to reproduce:
1. Power off laptop, then power on
2. Hibernate ("sudo systemctl hibernate")

Hibernate will not work.

Note that to reproduce the bug you need power off laptop, and then power on
it in step 1. Merely reboot doesn't cause bug. I. e. reproducibilty
depends on whether last boot was reboot or cold power on.

Also: suspend works normally (assuming I reverted 1796f808e4bb), but hibernate
doesn't.

This is "dmesg --level=debug+" on v6.18-rc2-with-1796f808e4bb-reverted:

https://zerobin.net/?0459f6411446622d#8i0Ifo6o68By3+UlYUr2t2KL7YLXsKEXrkfszpE77Rw=

This is config of this kernel:

https://zerobin.net/?04e89ceab8284c1d#9bpaZKqVXFSaeav/WW6GOCwD4i3SozzQ8pBEJ6LWwVM=

-- 
Askar Safin

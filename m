Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A1C35B130
	for <regressions@lists.linux.dev>; Sat, 25 Oct 2025 05:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761369372; cv=none; b=LJU1FHEhocAS2s1epVbFz9XrhPunQ9s0o+dOZHP3wkCsu3k7yeTQjsRptd+0mPwAdY5laWBNz4QL6d9Qrcod0QiR8WNwzS9wN7TBNBFRRDFtT6QrgSL95/NEUxeIiWf66+1WZp0PTLmUUHxmtRWXEc9VEVH8NRILsZrsEu+iccU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761369372; c=relaxed/simple;
	bh=n3Y+AcN/I881f5Cyv0rcUjEkJzVPX7TxD3E/j95volA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JSt9wClqFU9hwYDmT4HGwQbDUIh+6kRrDJ6FFjHqfIzlM2pmmW3/ktiQgCCe86JGKdBD7d03LIdD3vWgZWS9K0hfbj0fbQlZvlE9ZHN1vhy2lnV0iOEYPrw09xMR8FM493LUG+4NNJXSDfcvRr2qb3BDj81lJBEOaIXa3/i1TMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDQ7+9hU; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDQ7+9hU"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-63c3d7e2217so5361179a12.3
        for <regressions@lists.linux.dev>; Fri, 24 Oct 2025 22:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761369369; x=1761974169; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apaAoIq51aRtrkFWbmPU/2WaEbN9gRF7gSr6IfYPHi8=;
        b=DDQ7+9hUyKkqU7cKbFggN6YP5sIzkdieoOpkAp0aSY6/AfxxvwR16ReMXnm6PUWyp4
         Gz0obg7GYvc2lyK9/7KJkCwmlPrImKBUdpEifGozvUAx7ubRkzXI5gUMXCzCdmo+Z5pK
         xucpMa+bduCGwnTDFoozeBH+jx4pcOngJkekdj6gd+m3MZ4sZsXQJqExLgrHCvofJ+BI
         FiQNsWspAsF8QpGwnHqQZ7jHn6WRAAC6502Qmj+S3Fa23unUgNNd3FIGOeNIbVeshiUf
         c36NJ0jc2OZXbM/Sgz8Kpup4GyjdtDR/av2nFe4+jqz0mPFC0m2ikm3Cr6+r3J6hbnwt
         5psQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761369369; x=1761974169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apaAoIq51aRtrkFWbmPU/2WaEbN9gRF7gSr6IfYPHi8=;
        b=bTPuIX4/vK0r322n5Be9MmhQct/kNKdgdPtgcFF39GAs7jiEjG3I6TBKuHb7wDnk9M
         cTGz7Sk04/g1MJ17NQMsEwS7/CppSydRq2uxDodFXyWGuiinYKHXvm5Si3Z7eIP6ZM1O
         EDEfPFzO0G86X09Jvp5R6b4pLrIHYJizoccO5VT7y2PXHF/+c1MONUecN2EObbrkoqZO
         96RVhYJTljLQUlW6LOTvei59RIzxX7wS5qj9oMleYw2X82rRpPSaLWdAG/kIGAJ74xWt
         w0LHg95C5nWs4278L3c9TXeuQ83sRTcoixPRmloFg8zUowF9On0307b5f56TmXCmrn0b
         6TFA==
X-Forwarded-Encrypted: i=1; AJvYcCXfDC2FzxmVQXI+7Ay9oW01WL01KBCX9D6ULULq2RUvxZYdFAJRruUzRe7hykZvQVsLv8+CUK6zusQ5og==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxm4TVL+mREuJPSoTdjkEDReVm1k7zjda5i1t6mnJPS1WJBg173
	E1P2REpphvmFYmevelkw4/X8bqgp6Ln+3s52Grd+YM+oyFU12oF5FDd2
X-Gm-Gg: ASbGncvYjSIPCPCR7r/mt+0fEs2foMOGGvYe/f/2Y8Bo7sRoZ5jOcEFKRNnMTqj/M82
	5iS4aWF/tcXnwKmtqwBY6j6DM8+JVcCmFSCWEfG5JG7+CyPebouZOHn+XUCRZo00Ton9/zOQaRD
	wlsPFdPtmKsIY2YcscBXe8ATr5D/ug8M5LIkVmLJ5ed2jmUzUT/e1GUTqdbzenM7qgwsNsEAscy
	f56nzfgj8MIUJ22IdwDAU3bMIxJaqwXxKO5rnMWqnoLslSatgOmD6fAAZ5G8WzjvLtOModaUvjz
	d+2gQlhbVu+I6ci9AFlMfO8IKY4VrAkeQPqdNj0ln0rJ2zcX6JG9dmBe4u0kFGPzj24XL7n9x47
	ZXP94IB8QTvl/RY0pfUhfJOZpq3Wzfvf1KLNBkQl82kfhY61pJ8dVERsT7uiJkIsGoqjIQEwZg9
	Jk
X-Google-Smtp-Source: AGHT+IHfK/YxWnxAyIXIhhMhxrwpBPWIhtUQlBAlwL0IaxEpVGMgxfc2H8XED61ydnCh6Xfhe0uFJA==
X-Received: by 2002:a05:6402:2111:b0:639:fb11:9935 with SMTP id 4fb4d7f45d1cf-63e60084063mr4098867a12.4.1761369368832;
        Fri, 24 Oct 2025 22:16:08 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-63e7efb9fa6sm826566a12.31.2025.10.24.22.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 22:16:08 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: safinaskar@gmail.com
Cc: Dell.Client.Kernel@dell.com,
	andriy.shevchenko@linux.intel.com,
	chetan.kumar@mediatek.com,
	chris.feng@mediatek.com,
	hua.yang@mediatek.com,
	len.brown@intel.com,
	liang.lu@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mario.limonciello@amd.com,
	pavel@ucw.cz,
	rafael@kernel.org,
	regressions@lists.linux.dev,
	stable@kernel.org,
	ting.wang@mediatek.com
Subject: Re: [REGRESSION][BISECTED] "Wakeup event detected during hibernation" on Dell Precision 7780 (was "[PATCH v4] PM: hibernate: Avoid missing wakeup events during hibernation")
Date: Sat, 25 Oct 2025 08:15:55 +0300
Message-ID: <20251025051555.422427-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251021125446.4384-1-safinaskar@gmail.com>
References: <20251021125446.4384-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Askar Safin <safinaskar@gmail.com>:
> This is "dmesg --level=debug+" on v6.18-rc2-with-1796f808e4bb-reverted:
> 
> https://zerobin.net/?0459f6411446622d#8i0Ifo6o68By3+UlYUr2t2KL7YLXsKEXrkfszpE77Rw=

This log contains WARNING. It is caused by unrelated bug, which is reproducible
both on real hardware and in Qemu. I reported it here:
https://lore.kernel.org/regressions/20251025050812.421905-1-safinaskar@gmail.com/

-- 
Askar Safin

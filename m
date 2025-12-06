Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDE826FA5A
	for <regressions@lists.linux.dev>; Sat,  6 Dec 2025 18:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765046083; cv=none; b=gF6DUIQTUDqdvWU4HGQ1E/qfGkNEbz3WW7qxvNAtyPWlaSyoykeG47iXNF8PBOFfLFZyH3PlAOLOWKQrfyHmXmhFb//UTmKhmdwAp1uchndmCHnGlUZHt8B2U2AGzG/PJRs9KVun81p/VSFJ9Td2bRrMFKBjE3lHJ83zoIcr6a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765046083; c=relaxed/simple;
	bh=kA4hAN1sHiKFKheGE16X/PUth/xQ10ETqni3kNgL7bE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j81mwwZYaVWz5Q0ePkvyYXi6rKQMNIFaLlsdz3wt/FhYLO83Z+An+jL5oiXyG31K4r8EI/sm5NLQ2Vh8Btu2YJViOf2Y1zWNqZk0bRfHDsqSfc12mpJG4ePN8J68jYFCuuAfeuV1ATfmDrw5GR6kgIWjVsZWFR2KwKFYrttlUy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GKKCyx35; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GKKCyx35"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37b9728a353so43062801fa.0
        for <regressions@lists.linux.dev>; Sat, 06 Dec 2025 10:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765046080; x=1765650880; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YvEboDLvR2gzipynR26Tv9n7iFvwIWdMUwKccQoCWtg=;
        b=GKKCyx35V+LBIADyBf7MsRFx2Tp6o1/p1dy/v33OhJK291Fy94TIoElzqKOBidcK1p
         vv59YF4iZATxCWbgIXrhFIuYb1kIo5pMpaBEtbt4H73XGsxgfmlnwhA/8CPOJuaMBEU5
         odTJOGIBMri1yS+pn1PmwvmgkeE/OA6g2wv/3uIjxF73wNp25TAqT/MkLnaFoXE+ixp4
         q16jvofF5Ll3H1kLwy6zLsSyCeNlqUdGcohZIWvZqe+tbdsDINIjVMEJno8eQmUYoWzo
         994JbYg7x8ZgEyZw/vXioHQH2H6jOLL3RSX2QGRLosoY4sBQjwgIa0cqKu5CwH8hjKZS
         u06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765046080; x=1765650880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvEboDLvR2gzipynR26Tv9n7iFvwIWdMUwKccQoCWtg=;
        b=rLXagXX8eh4jVCKt/cVAzDJDuSAN4/TtcRIe+2ZfgJvxDHILYd6GCLmBeNpqCiBRia
         J8+WPv+ey0y/ImEBi0uU4dMjnAXnCPIaNXrwEpw6RUylNfew+lv0siVcei0LGhBw4389
         1YlLfDR1N+ywfkAMxwzlvssQYXAyccndiRFeuIY9CyH/L/GUVW86ifn7eF5jpfFMAuN9
         8LWzYDozCqpcF7PbDu8szKBiWjrgQK4nemTGgtRINdcJ4ugbFv1eOR8CPa7lq6/o78Gb
         sg4AwMd75Yxxavdwpi7+DISXSeYDmja0ItNovSDvHLY3xOSK8kuJN+xoKH1trsZE4nFn
         Bedw==
X-Gm-Message-State: AOJu0YyVyksn2UX8h08y1If2Lt/L16FTEEN/1gIKbncAfoloIZY0kPk4
	KTs4xnzcYrEEwMjxq4tDLxtVFFqBIjdAR/Iklhr7HTfvJF/jDBcvNrvU
X-Gm-Gg: ASbGncsNsJcYVATpqEjMQDYdSuGqzPkWFFLgJe6tH/rzRbKknTqpeJRHMEoAkoJ7cR5
	2g6QsRGVw0ZFKel1KUiZntd/77PTu+4BxiQ0K4o9zGAcITlqvSUKn+Egp9D7JoioD0rhtSB6sic
	0SC0Pg992AP645S0U0qGz3hP8NvNBjbCmHcZDYNYZCdYsv0XvrSTmwWK3BBf+MOlewSL5OFyECs
	N9KIJ6in8eyBraFtehEBMzVRqmrDMV2ZvneAOwmBTm9KVGYRaT9AV63O7KQLleruCVXAd1ogITf
	MVRgMXq+eXrEzW2C89rXwkNLd1Tv3UYFB/ezXReISGuXTDXMYu2Axh9zzluQCv0aSB8WwL8Kwe1
	sqPNoFwx4iY/Q1p2Csmss/ERQAd4bh9dv8xkLQlDJVq3Kt0qJES1ZcOmn+Rhy6mrpgOtVnbxFWj
	O1XliEHBXO
X-Google-Smtp-Source: AGHT+IG33E69bsxDqP4nGkx72DrGfYjPjJ2GkqS3YfyfrVavZ4K3jW7roYUUcqQB8woGw6GG0Vqd+A==
X-Received: by 2002:a05:651c:1546:b0:378:d5dc:17c2 with SMTP id 38308e7fff4ca-37ed1fb8099mr9884041fa.11.1765046079701;
        Sat, 06 Dec 2025 10:34:39 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-37e7060f2d4sm25155801fa.40.2025.12.06.10.34.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 10:34:39 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: Mika Westerberg <westeri@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: regressions@lists.linux.dev,
	Dell.Client.Kernel@dell.com,
	Mario Limonciello <superm1@kernel.org>,
	patches@lists.linux.dev
Subject: [PATCH v2 0/1] gpiolib: acpi: Add quirk for Dell Precision 7780
Date: Sat,  6 Dec 2025 18:04:12 +0000
Message-ID: <20251206180414.3183334-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1: https://lore.kernel.org/linux-patches/20251205230724.2374682-1-safinaskar@gmail.com/

v1 -> v2 changes: changed tags

Askar Safin (1):
  gpiolib: acpi: Add quirk for Dell Precision 7780

 drivers/gpio/gpiolib-acpi-quirks.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449 (v6.18)
-- 
2.47.3


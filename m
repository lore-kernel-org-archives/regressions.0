Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6CC17A31E
	for <regressions@lists.linux.dev>; Sun,  7 Sep 2025 15:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757257829; cv=none; b=VzLK9an7ZzRbfYHhjNeFJLTz/ykLJcNuKzpfNrae/kGyRV6rWOWmK0ofZy+VdAlZxpCYG5g6WTkPT//KZ00eCwOJ9MYxA2o39cO3tSnnYMoHrC2VeVOd8Gp+OhGf8jiHmwn6EaFV5G/55cA1mJ5r2iplD3HspSS1YaRn1yUt0RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757257829; c=relaxed/simple;
	bh=sAHtV31vC7+DbBtKfZ3bGC6susimxTF4qxvoih3PDug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mQq0dftvmFd3HxGkDRfRxGte53eW0UBiP2fkU4PJj2IU8/gpnXTMSPtFWVKaGsbUHeWbnmUd3K+xkBQOgJUKhtmwKtuGrr8YHBeFfoT/k5mwBZwua5EtNZ5c71OSS2u2ZC9TwfPF6pCazzOLepxv8xZOGJOlCr5bOAUZlKhc6Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=md0X8i/a; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="md0X8i/a"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afeec747e60so677402166b.0
        for <regressions@lists.linux.dev>; Sun, 07 Sep 2025 08:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757257826; x=1757862626; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oJuiBORU7uFgAwcceqMl7pia4M58UQmYtjkhakEe8GY=;
        b=md0X8i/ak5fdjztqM+kKivS+5G+0b1/wBCHWsiHH4ji4SynvZrrCTOaz3jsfORoUbv
         v1msD832ddO0ZIpxdj6pasKJzx/L9O752sBF46FQDytjMUoXcfmQziKvKQ8xkH9PYqFM
         RKR7iYLXXVwCxWDC9n/szm1dUYIHzcl2iShcgG8WRZj4WWOXxDk1Vj/b45VqRoThUfrR
         qkLDfIKl+VU0OlNvgN0BkAvlIDNHE6BaWInDFYC9gQjej1Npg3JcUQW5HH7T0rj4QR0U
         Y9+Vh8NC2/j+W+u0GwtIqezGMIRZ3ejk8SmQ5pfmn/HnujyQB3vRyo4ihOs6ECwQRwJ+
         n7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757257826; x=1757862626;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJuiBORU7uFgAwcceqMl7pia4M58UQmYtjkhakEe8GY=;
        b=QRrsgi4hpHDODX7axfwTD6PP6cb86RU0i6u9zLrLm8tz6oTW5vhjGP6U7Tnn0KhLnF
         VT69mciFKF/MktqvJHEWIkTBsSeQPwPNcmLmoi8idzxkYRF/8ms5rrtpJwwZCevAH+SV
         moDg1+Chggaxf2IVK4STrUb5ht9BFqGdroyegxmkb3uLtpc74FWw67QG+itRFme8b5hq
         AYVlqbRtnRtlAIH379BVUPXVQ3ijIAsROg7GiMEtblGoSji3fM/wArpAfe4CZgCnwZRn
         JRfGsaXDbN7JvN8TTvbFltFTugwyiQ6kC3IqIbu1dku0Z8rhMvQ9k2uQFu11prASiL3A
         6Upg==
X-Forwarded-Encrypted: i=1; AJvYcCVY82VxUtSoiw8WdbZUoEJ5CajWMrNrFqHPwvfV5Qa+JVx86CEd+Rk0uZh8EBrZ/CQmwSQ4+XhUYiQ8NQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdnhYrh2aKUU71fQQqdTNAyuDtStaLzdEaP/me1e50RgMg6jya
	8VxUetc0ikne31strU6oRNqCMsNmG8q2sRO6hDdacgPLtgyqtkl6BkdA
X-Gm-Gg: ASbGncsX2vdO/n+GLsCG4qgV22uVMsimns+Bic+4lXVfVA/esePf92togbus+Uy823N
	R35gOU4t7cTqiRMTRYuHn4qrFdiOlA6e2HGnaRIeyOrY2R4x/4Rzi16ZvDlgl9eu8kZIaoYb3vv
	6sEsQnGhJx6F01eVFRH28pE2jXYhvesrOYY7EyUI0ObyL05OGZEQAaI0nUd82U9Su42WqjQ4toM
	HxggCv6fU9ZmseYxnnjxXzTlMjxouj39UTQYRtEgJhRfAhii0IOk7ckGz3V6F+Gdq1lTCa9UDmx
	/VHkdHt3bJnCs/X1+HrwBLBSebIeiPVyNRNisiuGh9uGhkt7fzBtC1w5RA6mukBSPWFOe2z94pY
	kQfV9yQKdCMG1DTNyxD84bI0KP/yDpMKmZiUasn4ABGA2fETt733ikmoILdl3i7jSvw==
X-Google-Smtp-Source: AGHT+IEd/pDyjRmSKqgdbInAZgvxP22+j7RYNze25r80HBPkSMsOwswGrmhAArMFjtCaphKv56oPEA==
X-Received: by 2002:a17:906:99c5:b0:b04:858e:c1ee with SMTP id a640c23a62f3a-b04b13c13b7mr513268266b.2.1757257826138;
        Sun, 07 Sep 2025 08:10:26 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041800e89esm1837245366b.30.2025.09.07.08.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 08:10:25 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 4DBCCBE2EE7; Sun, 07 Sep 2025 17:10:24 +0200 (CEST)
Date: Sun, 7 Sep 2025 17:10:24 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Zhang Heng <zhangheng@kylinos.cn>, Jiri Kosina <jkosina@suse.com>,
	Staffan Melin <staffan.melin@oscillator.se>
Cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org, 1114557@bugs.debian.org
Subject: [regression] 1a8953f4f774 ("HID: Add IGNORE quirk for
 SMARTLINKTECHNOLOGY") causes issue with ID 4c4a:4155 Jieli Technology USB
 Composite Device
Message-ID: <aL2gYJaXoB6p_oyM@eldamar.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhang, hi Jiri,

In Debian Staffan Melin reported that after an update containing the
commit 1a8953f4f774 ("HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY"),
the input device with same idVendor and idProduct, the Jieli
Technology USB Composite Device, does not get recognized anymore.

The full Debian report is at: https://bugs.debian.org/1114557

The issue is not specific to the 6.12.y series and confirmed in 6.16.3
as well.

Staffan Melin did bisect the kernels between 6.12.38 (which was still
working) and 6.1.41 (which was not), confirming by bisection that the
offending commit is 

1a8953f4f774 ("HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY")

#regzbot introduced: 1a8953f4f774
#regzbot monitor: https://bugs.debian.org/1114557

So it looks that the quirk applied is unfortunately affecting
negatively as well Staffan Melin case.

Can you have a look?

Regards,
Salvatore

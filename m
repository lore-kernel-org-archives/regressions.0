Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC6F339704
	for <regressions@lists.linux.dev>; Tue, 28 Oct 2025 14:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761661812; cv=none; b=j8LwWnEYUjBraXGY3sakYPWQe5Slen5KqQsbcxUducfyOm24eiR38vRB/5yGF8Bbr9AEzCzgCxOndVKvm0LhNO9udZtxvG0/az+PEFdOGBy7lqnAP6fNdYuaCKCMRUtGiypeSZZbpR4JdWzEiBIMvwerb3c+Mha9khNeY+aGqAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761661812; c=relaxed/simple;
	bh=qFZVzHoOay+Mo2Gdf50RAGT5PXBic9cGcqZoKVnp0C8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QboXVN+19EMxgfTWk3sS/6QJbt1N/xoh+buDzfKPMgZMPa5qV13f8BTH7PJf42AO4ocUpDVZM3J8fROiVZqRIjXzdqFgaWltwpnW7rzSnayVJ2YIltr5qbtshVCCnO31Kda+ebOHGG/8m961thsd3OE/3nfImq0H1aLpzgGROv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=avm99963.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=avm99963.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-475daf41e47so3078445e9.0
        for <regressions@lists.linux.dev>; Tue, 28 Oct 2025 07:30:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761661808; x=1762266608;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qFZVzHoOay+Mo2Gdf50RAGT5PXBic9cGcqZoKVnp0C8=;
        b=BBlL9tS8Psnn5zQihp59UsQt54dTQPxfx98ZEC9HAkTU8xsfWTJyHFSCpg9DeYZ3F0
         +KzykZpTbyDOic+mbzT5KYmLuly86E1ZaNOCwxEveJz5UuXbG9EyhT+kK1b3mmtz6hgh
         kSZ6llH0BennHU5wbdn0vk0AHZeOa+eve9ocxLCfYqcSwjlByewCvd7YBn61VxyqZVIa
         5pwRyOA7CaaqWYenDEYss43aFDdEVDtpsppPUO+/XoaK1+ae704pXZL/Ngw2A10WRJhh
         L+ZPpMjgFOl3YuWOz38A71ca+9LoZjUaWH+K2iy6P/3pS6d8aySxq7cDx4zO8DeG7hvQ
         FnXg==
X-Forwarded-Encrypted: i=1; AJvYcCVQ4KQCVaxH3eeA6wc/eKE8kzh8tc2TWhHKvArnOrZ9vr2PiyKTnn9o96YQWjVLk00fpZSqka1jplKFrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKnNpigX1985CbvWSCAfZlkoWUVGEMvWJHbR6bO+agtCGN17r+
	Bo/3r8gYmc0c4LWEYgicHLClVVNsWTVGKWnROoxxWyh8Qs/1ulchC0g/j1huC8BuBR8BNw==
X-Gm-Gg: ASbGncvPGLSFkfQYf/M6GmDNgRy7t+b/+5yxMy4NwLAZGujRdAtgbhGiRvxC+YP9VxY
	UEisaLeT71rJXKdcPJTEMACOf7bttUHZtOEwvnwN4KKjCf9T+0otxSKpIdzosz2IwHf/8VYINa/
	rgSccMzW9B734SmZJhfKy7kP3K8hvyRE/bVezBGqX7LPP88ValtGymV5sAedHC7I2zNHnLS4X1t
	W1o+REd3CT54dHoDHEwt/qVqz2hvHMKF2sRWXJ5w1bEVbBbOtI0C1fzOomAoeouxrquS8C6AT5k
	GfbxJWI3L4Kk3vlAXBlhhhaI/9Q2PIPrKXaodfBXplp4u3/jx/RpsVjHEtbAggbSaQNsrWW0g3b
	vUNiA4evneELij9srvq+k273yaDq6tKWy3unV3el6beNIFQNra5FDlzwqXkyDEEaS4uhiBApM47
	X+ZaGMWJvF+2alWNKvEFKkWLB2pVqzTH080A==
X-Google-Smtp-Source: AGHT+IEZ0uB45+BlWnU5Fw2yyD+WHZbQGeAd+aFypPjK3ZMmzMMygBuPZqEaL4Uhwd7jmikatF9Agw==
X-Received: by 2002:a05:600c:45c5:b0:46e:5cb5:8ca2 with SMTP id 5b1f17b1804b1-47717df54eemr18317145e9.2.1761661808264;
        Tue, 28 Oct 2025 07:30:08 -0700 (PDT)
Received: from pixelbook (181.red-83-42-91.dynamicip.rima-tde.net. [83.42.91.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952ca979sm21236630f8f.14.2025.10.28.07.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 07:30:07 -0700 (PDT)
Date: Tue, 28 Oct 2025 15:30:05 +0100
From: =?utf-8?Q?Adri=C3=A0_Vilanova_Mart=C3=ADnez?= <me@avm99963.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	"Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, regressions@lists.linux.dev, 
	linux-pci@vger.kernel.org
Subject: Re: [REGRESSION] Intel Wireless adapter is not detected until
 suspending to RAM and resuming
Message-ID: <6qhbpyvzks5wvibjydjhqexh6ml6pmljkq4pbicfqt7l6vnmxw@4rvrunm34ylj>
References: <149b04c5-23d3-4fd8-9724-5b955b645fbb@kernel.org>
 <20251020232510.GA1167305@bhelgaas>
 <aPc4JpVyhCY1Oqd-@wunner.de>
 <zmkurgnjb4zw7zcg6uucbtvuratxlaau5lvhkgknidpjz7vnb7@dnsyjbrqtvqw>
 <aPj4kUglHgBm4uAt@wunner.de>
 <aPkD-cECjlXx3kJP@wunner.de>
 <fez2defptc57azalrjf5urjwvihnfsn6imxmkflm7evq4wye5l@6p5pqp4ofgyl>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fez2defptc57azalrjf5urjwvihnfsn6imxmkflm7evq4wye5l@6p5pqp4ofgyl>
User-Agent: NeoMutt/20250905-dirty

On Mon, Oct 27, 2025 at 05:36:02PM +0100, Adrià Vilanova Martínez wrote:
> I haven't had time to test the variant of the patch you shared here:
> https://github.com/MrChromebox/firmware/issues/786#issuecomment-3446469391.
> But I will do it later today (Europe/Madrid time).

I've left the results at
https://bugzilla.kernel.org/show_bug.cgi?id=220705#c6. Unfortunately I
got the same behavior :(

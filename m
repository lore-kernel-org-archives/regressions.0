Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6259B2E8B71
	for <regressions@lists.linux.dev>; Thu,  9 Oct 2025 13:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760016432; cv=none; b=LvI7bIHuns8RNpE8mrb3N7J6yQi7q2PIbAxDRcy1EBfkdee9OF5mXRy11fCXArOot722uU8dgK90YKeWIvnjUq135lOmcjr4FIaRm+odHJ91NQ7usHdElk+xWZ7ryynbnzrNgJouXQNaqNJhCx6RrNF4/LNc24uoPenU8FHLcTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760016432; c=relaxed/simple;
	bh=pK8K/WbHwPwZivX6tSUsXo2Jw21mQfQLrVFjbOAYGDg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FeRHFv+H3pVmgz/PSc6NoKo1vJDAFoo9zdRZDPeq1ACBW/MfAVw7L53olNo5o5ApAFUOXExH04fP9XpE9H7LYvMk6pMjJiq5KwlzpFLTgsdYS/FGBS0Unx9JxLQVhzmGqDwzQP7ecBiglabUzuvoRxiVxMOR8uP9rNpIR26M3zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igvCD13W; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igvCD13W"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b3e9d633b78so73047066b.1
        for <regressions@lists.linux.dev>; Thu, 09 Oct 2025 06:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760016429; x=1760621229; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pK8K/WbHwPwZivX6tSUsXo2Jw21mQfQLrVFjbOAYGDg=;
        b=igvCD13W0+n1OIfNhBG++64GCzhOKmTRdRPTCG7plTBr2TPWHrpMRbAux7ppIVdIo+
         tWlntTWoE2XveiWgMr4Vs9Qd0Ige9xhgrEr15QOsrRRgwC9l3jXN7YOtSUuek9nslNKs
         cvikfvhcxxqFLbG9alpPkLdh7a2ZNC1E/Qb4B1lClcRhleZL49uCZ7jFZ0BVC2XjhkSS
         fqFoDuvU1zlAhD6ANVv/BHvSfhxNT34rOtzuWRTL3A6JpdSmpRX0IyD0Qm/CmrLLnBH8
         I8GyRt7kuJAqcaWvZLw9yX/wJjJILGM6BXUJgm8Gt3qIZ/LgjIGJ2ruUBO9xmCIQv3Ww
         H85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760016429; x=1760621229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pK8K/WbHwPwZivX6tSUsXo2Jw21mQfQLrVFjbOAYGDg=;
        b=tsg1S7oE3EPnqMCZ+WuUDYYjskLH+5OBZeJZoz2w4IkxM/aNkQckoh5i6H6xYDU0as
         g6cMaKgC60gx8Tf5fciUeduf/7nX+yOYo/hf6tYgPe43R/U/8FUgZDKcHlW4ObvKRCVh
         PMQijAok596LWjwBzv7gQrxHcPl2rRkwI0TslXsIe301Ds61plOQ+dQIfAUlcs41fHG/
         0SRZpKFEhALJsYLrjS5DxXvBBXjsTZCsy3Xb+c8OaZAPkpV60ZWXSQzgK8i6RiWRjgTa
         SJ2rihulKcAievuavjegm+RRrNwsiy/qI/9w3h48R9GNp1LV/LbG1hjrKxYD0iHVZTpI
         z45Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3XWlPNLks7Mt2qsvuxTec4YU0Jjw0KrD98TfAK3wNLwaDkhWvPRUhpgCT1wMZVmsQdq6lWXb8RkI5YQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYfipg4ezYbGdm6i+X8z1WZJvMj4/ukPOvB8b/DPz3/J13q3lq
	PZnBEeodh+e70JNA9u+GmttXTWM31m4DAWlMLg1eOyq7HQfxlPFHeUKS
X-Gm-Gg: ASbGncscBFQbYQM6sb/RNUMNvzg6iBObTiqXbl9y56GCrhJQUErjwkxn8POFkjrJ+gJ
	bWubF3FiHfHRR5xBPoVKyu24Ltx5jymkSjv2zGKjS4K/Urh2nvjqc+XaQwQKEV3no0QuGGsilrC
	a0wRL42YCziwbTMSzvXPvJ1Z2iu2ZM6SXqpIoZEPG7CKDy6FKmPBRmJYO9U11DF0JHq1Cf/6Yoo
	ZRXYbcQmriCn1zzkU0yH1BHb9Q4jU6RZ+Y/cunAfeQJCG69Qbgwd9qnkOkr5hEGAoY6XQUGNCzh
	17FhtDC/+Lx2RX19sMlHvt2FviezUSDEB+Uomh5dXIFN+n4sNr5nMLAyLtkG+v54OqSD7761tZe
	tb26DD1aq67F/9GshSuu00KEFHHlnRMZc0SmB7FxIWwa2uzi9paioNJHr07VFw1yw5oPWkw==
X-Google-Smtp-Source: AGHT+IGtI8GEj+nLXCZCa6XbXOaSH9K657FNCc1DbTs+1bDecAX+bU9i3XEbHg0iBZzJAU3vTMmYaw==
X-Received: by 2002:a17:907:7b8b:b0:b3a:8070:e269 with SMTP id a640c23a62f3a-b50bd2454cdmr922900566b.14.1760016428139;
        Thu, 09 Oct 2025 06:27:08 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5395d748c9sm344572666b.73.2025.10.09.06.27.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 09 Oct 2025 06:27:07 -0700 (PDT)
Date: Thu, 9 Oct 2025 15:27:03 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Arisa Snowbell <arisa.snowbell@gmail.com>, linux-usb@vger.kernel.org,
 regressions@lists.linux.dev, Niklas Neronin
 <niklas.neronin@linux.intel.com>
Subject: Re: [REGRESSION] [REPRO] USB-A devices not working on boot after
 recent USB merge
Message-ID: <20251009152703.72e780b4.michal.pecio@gmail.com>
In-Reply-To: <90c03eeb-3913-4968-88c0-0de09023a2b5@linux.intel.com>
References: <CABpa4MA9unucCoKtSdzJyOLjHNVy+Cwgz5AnAxPkKw6vuox1Nw@mail.gmail.com>
	<20251007231709.6c16802e.michal.pecio@gmail.com>
	<CABpa4MCUnLUR_0Vzgd=rTr0+Hot=nxHirKrX6xtJWowDoLhWJw@mail.gmail.com>
	<CABpa4MCg7yixe7O8Pp+YwvpxeC=1JPhMhAap12RjtV6pcxFYgQ@mail.gmail.com>
	<20251008082055.5646dadc.michal.pecio@gmail.com>
	<CABpa4MCm8hQXvtSYqUA+Dh3rCLVM5rTC1p+FsgmFemv+Vyz=RA@mail.gmail.com>
	<20251008130532.49922d58.michal.pecio@gmail.com>
	<CABpa4MAsvK68CyQ7bVdie1j2m2O2YAEuFJHq8D-65uFT3FzKzQ@mail.gmail.com>
	<20251008223406.13f16f19.michal.pecio@gmail.com>
	<CABpa4MBGW=OJi+j34TbL2g=zyTg7-rxqpHYfAW-1DXTPk=g5Fw@mail.gmail.com>
	<CABpa4MBDvgJcgJf3_E7k1dBXs7v1tW-79dmc_sQDVM1bES5YDQ@mail.gmail.com>
	<20251009131444.2c221922.michal.pecio@gmail.com>
	<90c03eeb-3913-4968-88c0-0de09023a2b5@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 9 Oct 2025 14:30:20 +0300, Mathias Nyman wrote:
> Maybe the xhci->allow_single_roothub = 1; flag could be set in xhci_pci_setup()
> when called for primary hcd

Oops, I put it at the beginning so it is now executing twice on
two-speed controllers.

I only understood this remark when I saw my confirmation printk()
appearing twice after removing the "hide USB3 ports" hack.


Should I do a v2 or leave cleaning it up for later?
I suspect that imod_interval should also be moved a few lines down.

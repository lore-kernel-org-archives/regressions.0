Received: from mail-pj2-f16.google.com (mail-pj2-f16.google.com [74.125.227.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC5D32AAA8
	for <regressions@lists.linux.dev>; Sat, 19 Sep 2026 18:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789841512; cv=none; b=t3sV55P54jJkLfA6/3LeD42T9hfve+2OD5WYb/kVEJgHlFsAwj3QrPb4dOD3SajSWrzy5kheXhMTn2seQWQpLkl2wh/RO6nPhNzY2Op2HwLHvnl1vhGxAAlYk0Y/kznR12rPFs5vq5NSYEiUWpJM05aIhsu1QvaDwr1H8EAuCqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789841512; c=relaxed/simple;
	bh=0PG/SWLYExPZcuxoY1bWfDz5SxtM34z1QYtrvGHDGEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W45E7/QJkldVFIFLZOWy7c1VOXwceQdFCQj7BiVQKiWehwniP25k6o6K1/7EY0Pg06rvf5MB2drg3zEv0OqpXaz3CxVM6zzEqnKUJkSXwJvWURrMsMVh0Qbkt5t+MUXPrPxp2m17Hy3vZ+uW0jMUreAiUlcxrMsKAPCjdC6A5Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G723bX2B; arc=none smtp.client-ip=74.125.227.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G723bX2B"
Received: by mail-pj2-f16.google.com with SMTP id 98e67ed59e1d1-396ccd78e6eso678774a91.0
        for <regressions@lists.linux.dev>; Sat, 19 Sep 2026 11:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789841508; x=1790446308; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iSdi3wdBQsgY36I5hr86R3evxPH8QemSHvp8ROcgqiw=;
        b=G723bX2B5gKh8Niwo0CBtz3n8dqwvAIrZZI8VyH99hgcAj382V9GdOQ1o46CUZ0O/n
         tTJSek4UB2HJH9cZYKtuisVfYnxPmSq4mgHT1twyO5xiyn8UsipDshC578RtFoL63Lh4
         AtaROYduzkM74XMTw08hGnTbwpGouZ2egV9CJh/mWy7rG0ff0wD2WotMaZ1fnsVLBNB/
         W043hCKgud4gkfQVtoWP6ZwC7SScYVvHPwk5+JTlSfhWHRw+pVnVyNelh7NMrdm3baRv
         /lPOv8kIy3UmaJ2ZT3Mc1XxdkTMkSLEVZY4K7y0G2DCibH907j38rPWQUB5fQXWVY4VB
         nnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789841508; x=1790446308;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iSdi3wdBQsgY36I5hr86R3evxPH8QemSHvp8ROcgqiw=;
        b=pcjWrhfSVA14YPSGSZYRUkQbOc5uxhNCr56dUy2WydIrBDQCSw2VJXof+f32iNeYrs
         cMkwHKMF1fOfboe2xkZbis2D8xd6tn18b4UK+ssVNIfYL6r9P8WjIsyTJdntLxLpfHnU
         DZHm11VSUt8T9z0bGVub1jyRjnXVoaUENLMPczCdKdgW/wr21qVs2h3/H/plT8xxo3vn
         Iv8HaMx+AwWd4A9Ms31EsfuhBuyETBo6OHJw8Z9mxncoiaIC3/txBmulbC+fafmC0lh5
         nQe3Rq7i4sSQZVp6YCkO5QUbhXJpkoL3OWAJj2tQKzKKumyLBRzz5z6v5OHefDOM2GFh
         MR1w==
X-Forwarded-Encrypted: i=1; AKwUvBy7XkaYz+pceasEQOAZwTPUIcD8H3taNll8LSnwg+z+3x7r54M8HywcqOgnkq7q7gXIR9hmGnGTrvEATw==@lists.linux.dev
X-Gm-Message-State: AFuF++noTRH8fngSYLkzVb/d93W9Uk18kRJ6fWbZtSQ1EUOP2Of8FGnU
	TfwtzY8C84p4IuwVS2iy4DxSxEfGn4fbYIaRGXdI2xtMTu3z5yo5I2TQ
X-Gm-Gg: AYBFou2VrhYypJb5hGlbrqOBZ8imNxpnWYQBNrWzauFfgq2r+WiZpp9+8QWzjWaJEot
	PF9MXr/E/0NX6F18ziIsK3kD/X5pFTLsOarAiO9EH0aNFL7XKSf7RMKCcBLjbsbGa8HrIUvOsGo
	LHgvkOh+WHXeNOyyXVTtmexLlpx3ByVpHEh+rw43R1uGttpKb/xd2I82lC2z1x/byR2jaMFnIE1
	Lukbevm7IlfVRfFwkdexFOl8AXTbGuW9uyCj6pNYi65XbJn/Ge+MiO6R0FXTPTobxEfUyPSzyLm
	xOwzvNum8lJzWCdiisM63vx5a55BLGI3wnEfrPnoRmILAtt9IHou3hEgV/OIhECBFIa7E7gd9di
	uVx8fzNyK88vEIEtckljYMzuxLDv5G0blwb5KYT/hhixnnaQJrGkKkDHyP+a9p1za2E8tLANqk3
	kpeC90tG8bq+DeE/pBl/RCBcsC1wtRMe2oXJ6BDdPX34Ur1oUYtkV4J84jnfEULonior/HQj5sa
	aCtpcX4nm+dTdIuSVeKDb4WAVlB3eCxtK5Q+ws=
X-Received: by 2002:a17:90b:4a11:b0:39e:6c68:fd93 with SMTP id 98e67ed59e1d1-39e6c68fef4mr3104167a91.40.1789841507612;
        Sat, 19 Sep 2026 11:11:47 -0700 (PDT)
Received: from eggarch ([2409:40c4:1019:17ac:cb7e:823e:6cc7:69fc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c37c8e7sm5468055a91.9.2026.09.19.11.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 11:11:47 -0700 (PDT)
Date: Sat, 19 Sep 2026 23:41:38 +0530
From: Lovekesh Solanki <lovekeshsolanki00@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michal Pecio <michal.pecio@gmail.com>, Mathieu Fluhr <mathieu.fluhr@gmail.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] xhci: drop 120ms U3 LFPS wake retry wait from
 runtime resume
Message-ID: <aq5QXMlNQcBNsMfA@eggarch>
References: <20260831190349.29590-1-lovekeshsolanki00@gmail.com>
 <20260831190349.29590-2-lovekeshsolanki00@gmail.com>
 <a6a8526f-4b6f-46f7-9d02-05bfe3efcd48@linux.intel.com>
 <apbrp8EaJoIfEg5X@eggarch>
 <1be8e57f-9abe-4b34-bc09-e7934a2fa1bc@linux.intel.com>
 <apg16LtZ-ru9MIBQ@eggarch>
 <082467bf-d045-45d7-b097-97a5790e79d6@linux.intel.com>
 <apq4FFSD2QKG-jUu@eggarch>
 <aqrK5PwpJodCmbdM@eggarch>
 <b80ab121-2409-4ea3-9649-3aea4d1e7507@linux.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b80ab121-2409-4ea3-9649-3aea4d1e7507@linux.intel.com>

On Thu, Sep 17, 2026 at 11:16:03AM +0300, Mathias Nyman wrote:
> I don't think there is a need for a new PCI bus specific implementation.
> pm core then probably handles this already in a generic way.
> 
> PCI core probably calls pm core on a PME, which then starts the wakeup,
> pm core very likely keeps track of which device triggered the wakeup
> 
> The wakeup_source structure under power in the device structure (dev->power.wakeup)
> looks promising.
> Maybe we can find what we need from there. Hope its fields aren't cleared at the
> time xhci resume is called.
I looked into that wakeup_source struct and its path, unfortunately it
does not seem to carry this information.

There's no fields that record the cause of the wakeup event. and all PCI
wake paths fold into pci_wakeup_event(), the active flag in
wakeup_source only gets set for 100ms of pm_wakeup_event(&dev->dev, 100) in
pci_wakeup_event(). then pm_request_resume() runs but its async so it
may run after active field is cleared.

So even though PCI core does call PM core, PM core is not tracking the
cause.

I suppose my above proposal could be changed to a pm core flag that
may be a better option? Something like a dev->power.wake_resume,
bus could set it in pci_wakeup_event(), then we add a new resume callback 
something like pm_runtime_resumed_by_wakeup() and PM core could clear it
at the end of runtime PM transition.
But either way only the bus is able to detect PME.

Regards, 
Lovekesh

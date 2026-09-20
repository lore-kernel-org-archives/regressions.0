Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DB4471CE4
	for <regressions@lists.linux.dev>; Sun, 20 Sep 2026 21:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789939458; cv=none; b=SEaH2dXh6NXmKzlmzbAvEVGmKEnVrtLEFqQGjPZ8aN5iiCA2/UdM59zcBrfGrfz/bcveJrEf5LsPG/cA15EEY3ruTeWNL9GHkwW+zPqngPbn7mwuwIKo7mysvKj0/799xlQOcTFP5KB+qiVZJLg3hm+6aEcZp1CuF0iOBylv5G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789939458; c=relaxed/simple;
	bh=HAe9drQ2Ce/111VV1trP80s5SonnyEnE61XjrLoR3uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Do6Cph5/vr9jsa2QgNNekiQOgesa4fN93+J027Ua91RAV8TTkPrEc4GtuyGLfyYkIWJut5drnIwyw4lisnYhqRNkkcIT1JLarYUuqHRJc4FH0rJoEWDdHZ/Ys71j6RLGErQ3zvH3g6YB6lAc1Xb6cp4HehWDk8tVP75IBt046k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dx60zUUL; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dx60zUUL"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a1a631f6aso268572866b.3
        for <regressions@lists.linux.dev>; Sun, 20 Sep 2026 14:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789939454; x=1790544254; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPZKEOuc6OoXrjfYUnhc3ULWdAsyQzK6Afr3Z+Jdqrg=;
        b=Dx60zUUL6+1vxutyArBudTSdSVmvA0S02mbvVlchzVC2dU2/SmfmZxBhRgYLSvVIw2
         uBWKKqOq0JCLvXWqu5H1DIymHWG5s/xWkxYRRy1ICj9cWXjrCuzwPikRqKs31JR3TE1T
         TJSBcgMoN8F3HPhOJUUvrSMk3YeupHi+3wwQToeryC1ME23zecfnlcRtCcTxgRVxvM0x
         Qetp6FbCiZOFIaj/Lu4ZzwGOu59ss+rhdNs4Jq5dkFzgouKT6OffTKVPEfeIbV1bFl+W
         7qFKSGszrcxk09AHb93CjOzB30LcHBg7Z8KwKxKM7AkksCXltVRlCiQjWVUOZta4wX0d
         Ylkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789939454; x=1790544254;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IPZKEOuc6OoXrjfYUnhc3ULWdAsyQzK6Afr3Z+Jdqrg=;
        b=lA8ecgIsW9xpiIKim8PMNiaMz3ctMqy+oPCelWCuUJoArnNL3czCoPOp33jTu+4tSG
         PBvUDQn3yCX39hIT36Bqs2x2DkIzIiEUoAm5yU5DxyQXcoxsmWAleuWvfbQIfXfEf4I2
         1LRI0fRCzO2h41S0V0Ed1N9G0hSfbrGAk+EFWWkF5ymMRJj0BU+Tc/ltgpfCzHBFR7oZ
         NssbS5IvKDs8kstnxIVJAVMM3y32SOHG4pBLaQs+iVHXYufY5wSW1pEz7JQyO+dur2ug
         +9nTemyUsjdKpj6R8rkrOvPMl9ek7FtnmCq2fGeVrSpLAwa9H+4toTT40oUjRAb10HdN
         q2GA==
X-Forwarded-Encrypted: i=1; AKwUvBxQPQldk2FXBeEWsPY3gRkuUgrAr9NRb5CzmJh/16aT3ugIWaSStvTgD57e3qK5mqRyjk6Y2fPmSxIqmg==@lists.linux.dev
X-Gm-Message-State: AFuF++nWwCTThZIedaEohq1F7TLKcV/Zz5C1LDhIDs32m79rTdJGHBxV
	iiwI+XqaH/2r68O09yUob4HJJQKRLU0SBUIpBIYHIjlEFmiO0l2MmrzJ
X-Gm-Gg: AYBFou0XpuxuTXge+UhtEM6gVMhQXsZdZhPNQp1e9/LL6WBZVGRtKsmASoDoZsi8rR3
	cOoRiFD20Pf+EYz7S/HcLiGxIcfE7b8AV9l8RUH4gtGxA8+pXCxEKjZDMj0vlhql1EAG5sNKMHN
	+N21s4CGFpdiGl6zIrcgdgp+g0BBEFaoylT/R512z+f8QpG8I8neLgKgb+ntOFd5YAt+ZmtyVk4
	vAUsvoo9rycLYp/Sar5m5novIpM0ouwDU4tg1R8aoXQdvmMjK7/E/KpjpSBzhFCU9VwxQ/q+d20
	ssJMMgnN66cg7OvaUhe4VrsRnGxF3a97Bh4sVu0TUsmcoSGibOhUAqmd6tjdtvrYVlPpos7wYmJ
	Mc9gf4cE6xUetoPVmlv/MoMF07KaHbvNdi7foBRbWpR3swus1Th0dZejmVqWQkZyu2GKGDbaM0w
	vKE3CW2iYgJqINAYmpsbLlnV8ecP+75q7Gzv6wc54OUZR1AkQraD9+6c0dSHp8qNbJVknYc3+R3
	mYGsRQmPE2ncuWfjGxFd9RdczAQqcNhni0Ogho7NgM=
X-Received: by 2002:a17:907:a88e:b0:c29:f5d5:5aa2 with SMTP id a640c23a62f3a-c2a159a99e5mr731499966b.44.1789939454246;
        Sun, 20 Sep 2026 14:24:14 -0700 (PDT)
Received: from [192.168.86.89] (81-224-151-184-no600.tbcn.telia.com. [81.224.151.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a3590afccsm219473766b.62.2026.09.20.14.24.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 14:24:12 -0700 (PDT)
Message-ID: <9318fed0-31c0-4991-9f57-a1cabeeebcd9@gmail.com>
Date: Sun, 20 Sep 2026 23:24:10 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION 7.3-rc1] HID: logitech-hidpp: hi-res scroll mode
 forcibly re-enabled on every reconnect for Bolt devices, overriding userspace
To: Roman Stingler <roman.stingler@gmail.com>,
 Lovekesh Solanki <lovekeshsolanki00@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Filipe Lains <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <20260920094508.39682-1-roman.stingler@gmail.com>
 <arAe2iRkYh9p98Rf@eggarch> <20260920205058.11958-1-roman.stingler@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Erik_H=C3=A5kansson?= <erikhakan@gmail.com>
In-Reply-To: <20260920205058.11958-1-roman.stingler@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi!

> Possibly related
> ================
> 
> On this same Bolt topology the wheel also scrolls far too far per detent,
> apparently because hid-logitech-dj does not forward the hi-res wheel reports
> to hid-logitech-hidpp, so the multiplier-15 steps reach userspace unscaled.
> There is an out-of-tree DKMS workaround for exactly this WPID:
> 
>   https://github.com/Magnetar-OS/logitech-bolt-hidpp-dkms
> 
> I am reporting only the mode-reset problem here, but the two look like
> neighbouring consequences of the same commit and may be worth considering
> together.

There are two different patches that aim to solve this, but it looks like the
dkms fix is a bit more robust.
https://lore.kernel.org/linux-input/20260901-bolt-scroll-fix-v1-1-58bca7ae487f@protonmail.com/
https://lore.kernel.org/linux-input/20260904034843.1340846-1-rafael@rcpassos.me/

I think the best approach would probably be to apply Rafael's patch and see
if there's anything from the dkms patches that's worth including too.

Regards,
Erik


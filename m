Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A24C168C10
	for <regressions@lists.linux.dev>; Thu,  6 Jun 2024 12:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717675322; cv=none; b=Npn7W6fObCU/DXwPFwOLSdF45k+ICB2fVlqVEUNDKbyxX95LDNh1cHJtl3RGT3aWVI48YXFMbyvstGZScNt4dPl8QlUglQ75npOBP7voscT9ABlM26vDkkUbOPjpjTQO62f8rGtduSfNciqYKUPebljYpF0Zljy9Ojb6yE0Mf9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717675322; c=relaxed/simple;
	bh=XzA9XcS9J8/JaJGhY85xTyvzVAiJwfKIIBi3J6rxAwM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KSFp9HdaHuRkc3KDjQJUQfmuk4FKEAcIhdbXLkeN9l6+zxyJwaJWSM8ZgD+/zA8kaDLCoBPTIIAWQbfRn20+ZScleK89jc5Z1/e1ZBGug/ABYwyO+jLMrnwMgzzB0NQBbh5JdlLUHiXWJBtjBVD/ufXPNotczNRPLRtZHyyyNF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RnLROKiD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RnLROKiD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717675320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o1PVj6wl0RhMQ9aVu/kpZquF9TBmMzt7pDp7sPNrIU4=;
	b=RnLROKiDEbQqFqam6thCorke4vTls/P2yfkkAF/iaaA0uiPQRPU12dBzqpS/v3qSWx9Wo2
	yvlt/VsOl932VG6J6Q134k+B2ASmDVnaAZ7QRIT8tMQxjvvmC/9HHSvr+7oHWlIaG24LX2
	l7nJA+0pnrlnDNR3XB/chO1R2e3EsiI=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-M_AlA4btOHeZ6OVu8nu2Bg-1; Thu, 06 Jun 2024 08:01:59 -0400
X-MC-Unique: M_AlA4btOHeZ6OVu8nu2Bg-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2eaa74bfc18so6433811fa.2
        for <regressions@lists.linux.dev>; Thu, 06 Jun 2024 05:01:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717675317; x=1718280117;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o1PVj6wl0RhMQ9aVu/kpZquF9TBmMzt7pDp7sPNrIU4=;
        b=emju55dI+lHNnnzt6LpfZNnkbIMt760er2Oo5mtWM2tFsq/7tEPh+8+oQIYXt8oEwz
         BKm6SapQDo/GkgtqmRxWkoVZHDwrZuln2Ox+Tum4xlEA6g8l6F5+6f/9mia5EeRcItcu
         H/3j1q8mwjXlXWNg7C9d/FhnR4b5MxoIqkFfhF9kMMs+iRLVh2DoJNqdscOimGnrvl4O
         2xAJrJj9Tha1d2UyV55261dHNV+9WzDNO5hTjWy189lqZf3+ez/CA5lD+zn0d1MButLh
         ICYvfqJ5Gu1uFMTy2yLuCbo6Y+4VMi0LqGC3p8vN8b9IlD6bUb9HWefkrXST8NHOVflO
         0U2A==
X-Gm-Message-State: AOJu0Yz0nmE/6sCCXtoDfaZV9KLGAP3Xp9UB6K/ZqEDCCTkljK9uRnds
	YfIkKxQslWH6RPREsjmolkty6t4E9aBerf7ZQFZsHNJzusIQ7S8o+iRsvJWXffLycwaLZyPzTjT
	trVeKv/AbND6S1Pa/dlQ95JFA6/jZCzphXeG0nhog6M+0Z1YJcJL1VGsao6SX
X-Received: by 2002:a2e:6804:0:b0:2d6:dba1:6d37 with SMTP id 38308e7fff4ca-2eac79c3350mr33445021fa.11.1717675317619;
        Thu, 06 Jun 2024 05:01:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2WITeGFROobQCTrCntY3Omdm5T0qGOCAwnVA1tvshsd8kmSQuctYu9lHc2+ZfKmWSvWTupQ==
X-Received: by 2002:a2e:6804:0:b0:2d6:dba1:6d37 with SMTP id 38308e7fff4ca-2eac79c3350mr33444781fa.11.1717675317163;
        Thu, 06 Jun 2024 05:01:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aadf9d296sm980451a12.7.2024.06.06.05.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 05:01:56 -0700 (PDT)
Message-ID: <9d821cea-507f-4674-809c-a4640119c435@redhat.com>
Date: Thu, 6 Jun 2024 14:01:55 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: Hung tasks due to a AB-BA deadlock between the leds_list_lock
 rwsem and the rtnl mutex
To: Andrew Lunn <andrew@lunn.ch>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Linux LEDs <linux-leds@vger.kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, johanneswueller@gmail.com,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Genes Lists <lists@sapience.com>
References: <9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com>
 <15a0bbd24cd01bd0b60b7047958a2e3ab556ea6f.camel@sapience.com>
 <ZliHhebSGQYZ/0S0@shell.armlinux.org.uk>
 <42d498fc-c95b-4441-b81a-aee4237d1c0d@leemhuis.info>
 <618601d8-f82a-402f-bf7f-831671d3d83f@redhat.com>
 <01fc2e30-eafe-495c-a62d-402903fd3e2a@lunn.ch>
In-Reply-To: <01fc2e30-eafe-495c-a62d-402903fd3e2a@lunn.ch>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 5/31/24 2:54 PM, Andrew Lunn wrote:
>> I actually have been looking at a ledtrig-netdev lockdep warning yesterday
>> which I believe is the same thing. I'll include the lockdep trace below.
>>
>> According to lockdep there indeed is a ABBA (ish) cyclic deadlock with
>> the rtnl mutex vs led-triggers related locks. I believe that this problem
>> may be a pre-existing problem but this now actually gets hit in kernels >=
>> 6.9 because of commit 66601a29bb23 ("leds: class: If no default trigger is
>> given, make hw_control trigger the default trigger"). Before that commit
>> the "netdev" trigger would not be bound / set as phy LEDs trigger by default.
>>
>> +Cc Heiner Kallweit who authored that commit.
>>
>> The netdev trigger typically is not needed because the PHY LEDs are typically
>> under hw-control and the netdev trigger even tries to leave things that way
>> so setting it as the active trigger for the LED class device is basically
>> a no-op. I guess the goal of that commit is correctly have the triggers
>> file content reflect that the LED is controlled by a netdev and to allow
>> changing the hw-control mode without the user first needing to set netdev
>> as trigger before being able to change the mode.
> 
> It was not the intention that this triggers is loaded for all
> systems.

<snip>

> Reverting this patch does seem like a good way forward, but i would
> also like to give Heiner a little bit of time to see if he has a quick
> real fix.

So it has been almost a week and no reply from Heiner. Since this is
causing real issues for users out there I think a revert of 66601a29bb23
should be submitted to Linus and then backported to the stable kernels.
to fix the immediate issue at hand.

Once the underlying locking issue which is the real root cause here
is fixed then we can reconsider re-applying 66601a29bb23.

Regards,

Hans






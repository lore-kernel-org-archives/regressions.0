Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465A415CD6E
	for <regressions@lists.linux.dev>; Fri,  7 Jun 2024 10:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717755604; cv=none; b=Cekp1jGT6e4onACMnpuJPI9HZR5Hm45dGEPcNN1pxlI5Ye2WMN4O9Z5X1NEL1OCwdxFLeZ/y4b7bTJYC7dYQYJ542fAF07yMl8tZ90zoyshF+5c4FbV5KV+38Zsc1ruuEJwq6/dXww05Bg4z7Jul9LxBzO7gX/4yelxwjXcNnI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717755604; c=relaxed/simple;
	bh=vTEZCukUMXcbXJO9IWA8dOisP930Ku2NFFH6hnITE2Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQU0l044Z1Np2PunNx1E80/BX2f2D/QpQR2vUHnBMP+Kb0piIb5CSrTvKtug+f4r8s13INQbTzW8NONrpcbK7OJxrNOYaYoE++TVeiMHLFb5MQazTJN+0KUy7yffHpgAAiFluVn7zyUd+keU6135yld0DncSMhJ3/Wsy3E17uF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ixF5A2X4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ixF5A2X4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717755602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S/k0UOD2XzT93LwcNZDcZVp/aAS4aZSAyvm1MCnMlto=;
	b=ixF5A2X47B1jB1+AW6o1nRXu92axUOvsIiuad3wCIsIE14XCyz85iX4pcYSE5UzRGrQlJj
	JUo9QF17Sc1vp3k4zJWbdzkMTyqGo/VrTd6U1ZpWEHp0gtDuh1Ea/FfnR/+WRTtu11ZY2K
	lJsjriP4k4dZRz5+na5k9tuu1r8Xa2Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-dcAMcswkPeWGSRGCT0rOsw-1; Fri, 07 Jun 2024 06:19:59 -0400
X-MC-Unique: dcAMcswkPeWGSRGCT0rOsw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a6ef4489474so10254166b.0
        for <regressions@lists.linux.dev>; Fri, 07 Jun 2024 03:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717755598; x=1718360398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/k0UOD2XzT93LwcNZDcZVp/aAS4aZSAyvm1MCnMlto=;
        b=p9XkecfJF4H9BAeaF4cnJaXgTru6cPF2Fv8npLq4/wNn6DfDAkmMj5KH6scwfJCRuI
         784iX1CVsHUQExnYu8FR3URW5o0t4aH+Ar2lvP3vxSkrpoXcm/QbQ5GoyY24psFD860U
         pEuPikE0UlyYUNFIcbfwzyjcAeLiModw8/q0JrFXGHgnqZeNM8EHVu/XQ9rSqmDD2FcA
         EUOBjsu/ZK+xLOklN9+VbO7F7s+09tn0VaqRf0tY3wsLtji3O1ivHXr3YFplav8n7zpM
         eMrpjThVJGAkeB8HQBOvBmZHPjW5r6hQ93YhzEINR70CODtD/kUJ4oVIR9bZglVDXfaW
         +uWQ==
X-Gm-Message-State: AOJu0YyXAcjo8vVr/bHvlwONx9+bMQ5iZZOKueWvqADf1mVlZ1F3YHOO
	uUU6UtTaZyp3SomTCNgdgGbYYoNSitdvxNYIFk4NtYAHJUuFVSgF/JtHW8oy88PHD9zItG1lzvO
	1uSzaCncFG6087CaNJmb7Swl7xEZ2i+kVs5cFFJW2HNJVBuFPu2f489UCB93B
X-Received: by 2002:a17:906:1115:b0:a68:c6e5:3574 with SMTP id a640c23a62f3a-a6cdc0e40cemr136191266b.75.1717755597992;
        Fri, 07 Jun 2024 03:19:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpxxlwVPDRCJiZJv2Ua4GosyAN37/Sah9MwXT24eqOxTcjruBidwO3ep0dAi45T+RHQ8P8dQ==
X-Received: by 2002:a17:906:1115:b0:a68:c6e5:3574 with SMTP id a640c23a62f3a-a6cdc0e40cemr136188466b.75.1717755597601;
        Fri, 07 Jun 2024 03:19:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c806eaedesm223566166b.119.2024.06.07.03.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jun 2024 03:19:57 -0700 (PDT)
Message-ID: <5d037003-a90b-4607-8eb6-6fdd5824e373@redhat.com>
Date: Fri, 7 Jun 2024 12:19:56 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hung tasks due to a AB-BA deadlock between the leds_list_lock
 rwsem and the rtnl mutex
To: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Linux LEDs <linux-leds@vger.kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, johanneswueller@gmail.com,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Genes Lists <lists@sapience.com>
References: <9d189ec329cfe68ed68699f314e191a10d4b5eda.camel@sapience.com>
 <15a0bbd24cd01bd0b60b7047958a2e3ab556ea6f.camel@sapience.com>
 <ZliHhebSGQYZ/0S0@shell.armlinux.org.uk>
 <42d498fc-c95b-4441-b81a-aee4237d1c0d@leemhuis.info>
 <618601d8-f82a-402f-bf7f-831671d3d83f@redhat.com>
 <01fc2e30-eafe-495c-a62d-402903fd3e2a@lunn.ch>
 <9d821cea-507f-4674-809c-a4640119c435@redhat.com>
 <c912d1f7-7039-4f55-91ac-028a906c1387@lunn.ch>
 <20240606063902.776794d4@kernel.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240606063902.776794d4@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/6/24 3:39 PM, Jakub Kicinski wrote:
> On Thu, 6 Jun 2024 15:12:54 +0200 Andrew Lunn wrote:
>>> So it has been almost a week and no reply from Heiner. Since this is
>>> causing real issues for users out there I think a revert of 66601a29bb23
>>> should be submitted to Linus and then backported to the stable kernels.
>>> to fix the immediate issue at hand.  
>>
>> Agreed.
> 
> Please submit..

Done: https://lore.kernel.org/linux-leds/20240607101847.23037-1-hdegoede@redhat.com/

Regards,

Hans





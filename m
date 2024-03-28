Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC02F1384A3
	for <regressions@lists.linux.dev>; Thu, 28 Mar 2024 21:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711660135; cv=none; b=g4nL8qrXxQVn2l4RuanBOVV67FGb15+wTyn0+zXh07P4uunCxZUWp01olkFeUwN2XyUV+1vPNGEnCWAq8Rmt73IKSjzmeJyhNnIexgonFbgUAUdlBbH8ScUaXFrCI2N7CeHuYCH//z64VK1WnHNE7l/RgtmXUiEp8jE+axn1ef0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711660135; c=relaxed/simple;
	bh=F4IrvSS6WvfTbwg+S1nOzbzpIHvcq0dGlD5txkHzVK0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fupKa9BndLXJrWIQu6Mu48/7OjV3M4YlX9DImTezOoPboTXKLRXRwTjCBTMOH4lOuQTi71N0aYHggkRD9ukBJk+4FO4oKxMfvbAZpToGdK/ZndueK+tRQXmx1NnCobZqPTTaQuOxGdYjB9SpW/ORcnLtRCD4NWx/ZMqnLjpD1G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=RhR9pQlV; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="RhR9pQlV"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5a467dae51dso506890eaf.1
        for <regressions@lists.linux.dev>; Thu, 28 Mar 2024 14:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1711660132; x=1712264932; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fhOqlDsFnhyStsUL+RT7PNmxZO7uBWizHf6GICmX+OI=;
        b=RhR9pQlVRQRu6JwR/gCaszwL3MfEyNV6c0fCl/CUU7fKz2mCka8px9BCDqXj0BcEm/
         YCalvECxzZ8rQ6kPeWf9LImgmot4iEJPf67kFtV27TcPuIpsCq90T8jODDNAEWf28TBC
         eU+9O4OmInGvvtS6y9jxwn4vj4dKaNZHAaC8XDbwit98o0nViyzsjO5PpVV1L92YmUPu
         1oP9xGE/Isx9pEy6Ug8IlWRtCHj8xtX3dOesZVvQ4KCuXZ9Xw58KFOC2SwrPxnlEgYyL
         A7sKf+odlh/mXbY8KrzTmGUg9GWKebZXdOeVEbMPDIX87w82JLP9+KxI4jrYlxf7C1Bi
         U+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711660132; x=1712264932;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fhOqlDsFnhyStsUL+RT7PNmxZO7uBWizHf6GICmX+OI=;
        b=bkAvoc6UcaEIYW3JITfevsLsEdGr4tbXw+1T2z8H2CB+fps2QCEsuxvL5wRDhxDA2A
         J6Y+QVfCy/deZvF6vuNjC962LyvZYFsCWPRLdKQtAPepSkdkbpG3SJw0Rp8sW7qHngY0
         A7j58A/21iyU8bo8ZGmQeB2XNSTDz6e8Wf6/A7+uUMCdD7F6wlOzgsmqOOkT21YhWTXF
         F2ZxfKYW+oZdIDo621SwoNOBm/mSlY0+SDy/kt7QRoDDPD/N7ZRE2NumBvjPGaeXGHK1
         L8J9QnTJosupJCeQ+VtSPM6YkJVBR9yHt20AwZ7Nwp8uQ9Uyx1Iib3rGAGD4NATkSNUU
         0WOw==
X-Forwarded-Encrypted: i=1; AJvYcCV2LpIpStFJBXXl8z5yPtvTI3omECV302hubtKdOf3h9/7NcoXQr0U8eRzbcM2J2glCEwH11aAVDsT8Sqs6cde76TlRL5hdIx+3ubA=
X-Gm-Message-State: AOJu0YzdraGuAH/RBNTG6hNqDwTow8pLBgG9q+EAu0kJNVddLi9j2xll
	SANdPMck9seo5wJWgLbn3bZh7oIdu68A5VrsoVJBl2UdpvfPbheaR1KNATyG3Z4=
X-Google-Smtp-Source: AGHT+IGfo+9brJXeQXDPL+VZY/J/lhapMlsOdjDfc2YE8PgBEa/Sxxdwof6mO9UnEH8hZci7XVl3nQ==
X-Received: by 2002:a05:6820:208:b0:5a4:7696:6ba8 with SMTP id bw8-20020a056820020800b005a476966ba8mr317575oob.7.1711660131965;
        Thu, 28 Mar 2024 14:08:51 -0700 (PDT)
Received: from [192.168.0.50] (dhcp-24-53-241-2.cable.user.start.ca. [24.53.241.2])
        by smtp.gmail.com with ESMTPSA id l26-20020ac848da000000b0042ee2bda028sm954486qtr.54.2024.03.28.14.08.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 14:08:51 -0700 (PDT)
Message-ID: <943c6d11-e214-43c8-8813-8e1aba6be15c@draconx.ca>
Date: Thu, 28 Mar 2024 17:08:50 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PROBLEM: Only one CPU active on Ultra 60 since ~4.8 (regression)
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CADyTPEwt=ZNams+1bpMB1F9w_vUdPsGCt92DBQxxq_VtaLoTdw@mail.gmail.com>
 <CADyTPEyAidGgBT3f1VJLHb3ouO-r1UyvFp1PcwXxy0NRG94sbw@mail.gmail.com>
 <1df92fec-7f57-5080-94ed-b149ed384280@leemhuis.info>
 <14dcd743-144a-9f7b-849c-0843d50e4c04@draconx.ca>
 <4dce7447-678d-4e60-b76e-b01988bd6515@leemhuis.info>
 <CAHk-=wgFuoHpMk_Z_R3qMXVDgq0N1592+bABkyGjwwSL4zBtHA@mail.gmail.com>
From: Nick Bowler <nbowler@draconx.ca>
In-Reply-To: <CAHk-=wgFuoHpMk_Z_R3qMXVDgq0N1592+bABkyGjwwSL4zBtHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-03-28 16:09, Linus Torvalds wrote:
> On Thu, 28 Mar 2024 at 12:36, Linux regression tracking (Thorsten
> Leemhuis) <regressions@leemhuis.info> wrote:
>>
>> [CCing Linus, in case I say something to his disliking]
>>
>> On 22.03.24 05:57, Nick Bowler wrote:
>>>
>>> Just a friendly reminder that this issue still happens on Linux 6.8 and
>>> reverting commit 9b2f753ec237 as indicated below is still sufficient to
>>> resolve the problem.
>>
>> FWIW, that commit 9b2f753ec23710 ("sparc64: Fix cpu_possible_mask if
>> nr_cpus is set") is from v4.8. Reverting it after all that time might
>> easily lead to even bigger trouble.
> 
> I'm definitely not reverting a patch from almost a decade ago as a regression.
> 
> If it took that long to find, it can't be that critical of a regression.

FWIW I'm not the first person to notice this problem.  Searching the sparclinux
archive for "ultra 60" which turns up this very similar report[1] from two years
prior to mine which also went nowhere (sadly, this reporter did not perform a
bisection to find the problematic commit -- perhaps because nobody asked).

[1] https://lore.kernel.org/sparclinux/20201009161924.c8f031c079dd852941307870@gmx.de/

Cheers,
  Nick

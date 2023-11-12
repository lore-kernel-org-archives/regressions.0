Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FE41863E
	for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 20:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MnrLpGLN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699821800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R/lZSLfHSJ3lgfaPtLw9pH3ZZ2OWkdNMAIZm5OTZRi4=;
	b=MnrLpGLNCU/GSFKSecgcdN/CPP6/YrQkPuxsu/py163afm6VPJdgUzrVK3mRDMc0Q81ANk
	sY7VYyRylOiTaWXtDoyX3+Dij1gJs1HdphlUyKqBFXfO0MrWQnGHX2/AmJf1GT198I95FB
	jk3sfWGUYLwxPXm/7RPsa9pj8nq+Gcg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-jUqTGbktO_e6lukTekQY9w-1; Sun, 12 Nov 2023 15:43:19 -0500
X-MC-Unique: jUqTGbktO_e6lukTekQY9w-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9e8b2d32d88so31748566b.0
        for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 12:43:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699821798; x=1700426598;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R/lZSLfHSJ3lgfaPtLw9pH3ZZ2OWkdNMAIZm5OTZRi4=;
        b=Dg2Sp/R4GKFb9cmHiPc6gOeKkLb2m7YC4p77j/epQ0Df2kyf2SNNfG+FDpz2ijPOO6
         HeM7Ye4XSnXbLU9Ppz1/8nna+LRtpxluzyrqbRGI1ol0ZrW0iNzBsK0FpHKw86gxk7ef
         KJ+eDzkyopvBU67TnfyDblMbFodSSz8dFNuJUpw//gBuJFikxtku4va6vtm9kC9uW51D
         6qojm6Vb8Blvz/bFSubt+ZuCbm2jMhlyV9qPN+7KWcl0gXF9z1+OeiyjTubIwZ840IwK
         4nHNvOIGI4AGUIZVrB3M6VfAgFHVpaLG6CqnDOaAyuTjLJp2FpocZyPcx33kIB9sNDqV
         fgyw==
X-Gm-Message-State: AOJu0YwoGDipImWpIfl/OtcFnZm8k4mv0CwQ7OnJrvRfrodQbR0Rpq5/
	jy49thZHkpPp0W3rPpjqa0GQmCGsfrYrJtSKt09gyVb3T+qxpwugW1M2vVIboKfO+EvHNff8Sui
	VkPI/MDjHezvd7kniRe6OZUQ=
X-Received: by 2002:a17:906:300b:b0:9ba:a38:531e with SMTP id 11-20020a170906300b00b009ba0a38531emr3544793ejz.52.1699821798021;
        Sun, 12 Nov 2023 12:43:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpZkasG8Lh5Q8a2Bx2iRoNIZThOCEb3KwkB/3fA6F8wH2CFJrCrtz7uQQMTLVT5JttMyI6IA==
X-Received: by 2002:a17:906:300b:b0:9ba:a38:531e with SMTP id 11-20020a170906300b00b009ba0a38531emr3544777ejz.52.1699821797566;
        Sun, 12 Nov 2023 12:43:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id h8-20020a170906260800b009dd98089a48sm2973331ejc.43.2023.11.12.12.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Nov 2023 12:43:16 -0800 (PST)
Message-ID: <55698544-8cba-4413-bdd3-79cfaa1f3c44@redhat.com>
Date: Sun, 12 Nov 2023 21:43:15 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION]: acpi/nouveau: Hardware unavailable upon resume or
 suspend fails
To: "Owen T. Heisler" <writer@owenh.net>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Len Brown
 <lenb@kernel.org>, linux-acpi@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <9f36fb06-64c4-4264-aaeb-4e1289e764c4@owenh.net>
 <CAAd53p7BSesx=a1igTohoSkxrW+Hq8O7ArONFCK7uoDi12-T4A@mail.gmail.com>
 <a592ce0c-64f0-477d-80fa-8f5a52ba29ea@redhat.com>
 <CAAd53p608qmC3pvz=F+y2UZ9O39f2aq-pE-1_He1j8PGQmM=tg@mail.gmail.com>
 <d1ac9c1e-f3fe-4d06-ba2e-2c049841d19b@owenh.net>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <d1ac9c1e-f3fe-4d06-ba2e-2c049841d19b@owenh.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11/10/23 17:58, Owen T. Heisler wrote:
> Hi everyone,
> 
> On 11/10/23 06:52, Kai-Heng Feng wrote:
>> On Fri, Nov 10, 2023 at 2:19 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>> On 11/10/23 07:09, Kai-Heng Feng wrote:
>>>> On Fri, Nov 10, 2023 at 5:55 AM Owen T. Heisler <writer@owenh.net> wrote:
>>>>> #regzbot introduced: 89c290ea758911e660878e26270e084d862c03b0
>>>>> #regzbot link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/273
>>>>> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=218124
>>>>
>>>> Thanks for the bug report. Do you prefer to continue the discussion
>>>> here, on gitlab or on bugzilla?
> 
> Kai-Heng, you're welcome and thank you too. By email is fine with me.
> 
>>> Owen, as Kai-Heng said thank you for reporting this.
> 
> Hans, you're welcome, and thanks for your help too.
> 
>>>>> ## Reproducing
>>>>>
>>>>> 1. Boot system to framebuffer console.
>>>>> 2. Run `systemctl suspend`. If undocked without secondary display,
>>>>> suspend fails. If docked with secondary display, suspend succeeds.
>>>>> 3. Resume from suspend if applicable.
>>>>> 4. System is now in a broken state.
>>>>
>>>> So I guess we need to put those devices to ACPI D3 for suspend. Let's
>>>> discuss this on your preferred platform.
>>>
>>> Ok, so I was already sort of afraid we might see something like this
>>> happening because of:
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=89c290ea758911e660878e26270e084d862c03b0
>>>
>>> As I mentioned during the review of that, it might be better to
>>> not touch the video-card ACPI power-state at all and instead
>>> only do acpi_device_fix_up_power() on the child devices.
>>
>> Or the child devices need to be put to D3 during suspend.
>>
>>> Owen, attached are 2 patches which implement only
>>> calling acpi_device_fix_up_power() on the child devices,
>>> can you build a v6.6 kernel with these 2 patches added
>>> on top please and see if that fixes things ?
> 
> Yes, with those patches v6.6 suspend works normally. That's great, thanks!
> 
> I tested with v6.6 with the 2 patches at <https://lore.kernel.org/regressions/a592ce0c-64f0-477d-80fa-8f5a52ba29ea@redhat.com/> using <https://gitlab.freedesktop.org/drm/nouveau/uploads/788d7faf22ba2884dcc09d7be931e813/v6.6-config1>. I tested both docked and un-docked, just in case.
> 
> Tested-by: Owen T. Heisler <writer@owenh.net>
> 
>>> Kai-Heng can you test that the issue on the HP ZBook Fury 16 G10
>>> is still resolved after applying these patches ?
>>
>> Yes. Thanks for the patch.
>>
>> If this patch also fixes Owen's issue, then
>> Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com

Owen, Kai-Heng thank you for testing. I've submitted these patches
to Rafael (the ACPI maintainer) now (with you on the Cc).
Hopefully they will get merged soon.

Regards,

Hans


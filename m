Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C6F1F03C2
	for <regressions@lists.linux.dev>; Thu, 13 Mar 2025 18:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741891638; cv=none; b=iwGlSfviHMdNZqdBhYBhLKLG9CwxXiTa2XrYT4yFvw4ZZSncVoSMD2LNu6DPV+zDJTDO0VL5XiU5p5GlSalGJzI73BspKU6S7/97N9bDCKIs5JBd+VBYcNW/fOEoftvqZbEoLPkwgUODzz4Gd5KIa/NsAXxe0IZxVKGWLCmJpOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741891638; c=relaxed/simple;
	bh=1Wj0bufZ7EjYi7U/RFgZ/s0fjo6rJSEGTvGZw1CTU4M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r140GXX20ehOU4tjMhtRK9wUeDgfyrDDd5rM4iNnlTjK31Y/5UAwqASv/Vfgn/X/bn7kEpvI0hBi7iUoWkdpvS4NTwduS5T+DQxYBtTzmTx20yYGm/MVNrDRbGei9l1GyWzVXiB4cZczJBaFKVddcRPpbpdpw1YxNkdqxo8lOZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PhVICmjH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PhVICmjH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741891635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1GojteExoK1LwIk/yNQWtkCvbvibA9jZBZEt4xD5tPU=;
	b=PhVICmjHiAkzwUUZdyoL4osWwKgGaaM7zdk9P/YL2vpeRn968IH5uCqAgL1omOKL45FhDR
	+m3xVx+6k+obwDjZfpkW9Wx+bEUuujV22U3tA7c8MaV/EfBBXAu9IBqsI9PTrr7v9SugSr
	P1I2cPT3l16UWaPUfBr8mgPhsd6EZSM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-Dm8kaaj7PSSYkqAOwCEbRA-1; Thu, 13 Mar 2025 14:47:14 -0400
X-MC-Unique: Dm8kaaj7PSSYkqAOwCEbRA-1
X-Mimecast-MFC-AGG-ID: Dm8kaaj7PSSYkqAOwCEbRA_1741891633
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac287f28514so126811166b.0
        for <regressions@lists.linux.dev>; Thu, 13 Mar 2025 11:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741891633; x=1742496433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1GojteExoK1LwIk/yNQWtkCvbvibA9jZBZEt4xD5tPU=;
        b=cVJOHaIKHL/Swq0MeS5wYJny0OATjcSbosLBrk4q4snpGm4sqontV5DNXoTXbIs9Tu
         izqS6UfLgAqp1oS/Q8KXLIqDHuJwQQl27T0NEypqGDTZSJYlXyPwYOFkZsq7LC029nBQ
         QPv6tEEy7X34AKskcEHtRVgPGCOEGgEKf8Bp/KIWquAedXqfVJ+uQr44BTQkaAwzkLwo
         BcUlwnwDVtqlaE5iQdiXeBKjL0uFkq14jBH5DKUEK2ujd/idXsNIYJyl7uEqUmH9uQTz
         SyBoujn4HMFv5EVZkU5kYdUM4/hLQXRr7irEviN0NezJfjtFPcjGdkdPDp/6okCbsX+r
         DZbA==
X-Forwarded-Encrypted: i=1; AJvYcCW6zdv84MP/QiAMoX2fgNrgOB8o6t5Wef8y5/TU93dUHyQSOM/Z08bpNknzafDgySjBoRP/9Rs9VLJVbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUO0S3ug0uyjK3qkq4r4ZS/1Vn7lyL8WhH1a0v4C6FqBzLno6n
	LgZY6vsmOyG2S+fHuzyp4h/yyJr4GhqRgcv3MO4Bh6lHp7a42ZIvH28P2rgIDLQE2n0EKUydN9j
	Dfgu0SENZOKVuTtgJJai9E9PvwtxvlTXQwUsZmIIW1C1P3VnGjCNVh0UGRXQs
X-Gm-Gg: ASbGncvvmsPEBc+LjFQOLQ1/IY6MKDeK6A9XhQvWGiFwhTo7BqJNh+BsC75XmVFZcac
	KwMIIJOAANOeohFpc8uACQpGJujBtsUVvKLdFCPXC5y4hk6+YZggIkwy1UYsaDjSX1TU3RzjLZJ
	/lHxBIqYqVGFwjGa3NiSNQLk1QAn62BBSmFBLwCI7vL2zQ4F7dLvxPnWqTDEwz6xBvFH0ChjgjZ
	ETVeNKMwncpvoQbFdAFh831MYnj+ryUGGcoYMaMWxazlKSwQ/OuXgIe6wY73UFmdWj4gsbaMiIc
	EUug4j9kBkT2ImrCoH2BbzEia1ixqffiyOSFMhS6Oh/yD9ISWgGYsTpV0WFWdHBvubQd72u9MTI
	n//okLn+ePqP2uFen8PbQlkRtfH04HSIY7TE1Hx5CBVIisrdne4P6E7VznrX0daCVCg==
X-Received: by 2002:a17:906:f59d:b0:ac2:8428:c5c2 with SMTP id a640c23a62f3a-ac328fbd7a2mr59818366b.20.1741891633360;
        Thu, 13 Mar 2025 11:47:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF200838Q9PH//rlXMgJcC7gCBuHjGntLC+HFTNJDzLV0/czimB9kN73ACIsQRgz1KoSS/F/Q==
X-Received: by 2002:a17:906:f59d:b0:ac2:8428:c5c2 with SMTP id a640c23a62f3a-ac328fbd7a2mr59815866b.20.1741891633001;
        Thu, 13 Mar 2025 11:47:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a48b51sm112898266b.149.2025.03.13.11.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 11:47:12 -0700 (PDT)
Message-ID: <6d125c69-35b2-45b5-9790-33f3ea06f171@redhat.com>
Date: Thu, 13 Mar 2025 19:47:11 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression from 7627a0edef54 ("ata: ahci: Drop low power policy
 board type") on reboot (but not cold boot)
To: Niklas Cassel <cassel@kernel.org>
Cc: Eric <eric.4.debian@grabatoulnz.fr>,
 Salvatore Bonaccorso <carnil@debian.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Christoph Hellwig <hch@infradead.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Damien Le Moal <dlemoal@kernel.org>, Jian-Hong Pan <jhp@endlessos.org>,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-ide@vger.kernel.org,
 Dieter Mummenschanz <dmummenschanz@web.de>
References: <Z8l7paeRL9szo0C0@ryzen>
 <689f8224-f118-47f0-8ae0-a7377c6ff386@grabatoulnz.fr>
 <Z8rCF39n5GjTwfjP@ryzen> <9c4a635a-ce9f-4ed9-9605-002947490c61@redhat.com>
 <Z88rtGH39C-S8phk@ryzen> <383d5740-7740-4051-b39a-b8c74b035ec2@redhat.com>
 <Z9BFSM059Wj2cYX5@ryzen> <9ac6e1ab-f2af-4bff-9d50-24df68ca1bb9@redhat.com>
 <Z9LUH2IkwoMElSDg@ryzen> <d5470665-4fee-432a-9cb7-fff9813b3e97@redhat.com>
 <Z9L5p6hTp6MATJ80@ryzen>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z9L5p6hTp6MATJ80@ryzen>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YiQ8RPdqA9Guo7us4qTTj8dN18lOtAWMQ3q81EOwFOU_1741891633
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 13-Mar-25 4:28 PM, Niklas Cassel wrote:
> Hello Hans,
> 
> On Thu, Mar 13, 2025 at 04:13:24PM +0100, Hans de Goede wrote:
>>>
>>> Considering that DIPM seems to work fine on the Maxtor drive, I guess your
>>> initial suggestion of a Samsung only quirk which only disables LPM on ATI
>>> is the best way?
>>
>> I have no objections against going that route, except that I guess this
>> should then be something like ATA_QUIRK_NO_DIPM_ON_ATI to not loose the
>> other LPM modes / savings? AFAIK/IIRC there still is quite some powersaving
>> to be had without DIPM.
> 
> I was thinking like your original suggestion, i.e. setting:
> ATA_QUIRK_NO_LPM_ON_ATI
> 
> for all the Samsung devices that currently have:
> ATA_QUIRK_NO_NCQ_ON_ATI
> 
> Considering that this Samsung device only supports DIPM
> (and not HIPM), I'm guessing the same is true for the other
> Samsung devices as well.

Ah I see ...

> So we might as well just do:
> ATA_QUIRK_NO_LPM_ON_ATI

Yes I agree and that will nicely work as a combination of
ATA_QUIRK_NO_LPM + ATA_QUIRK_NO_NCQ_ON_ATI functionality
so using tested code-paths in a slightly new way.

Regards,

Hans




> to disable both HIPM and DIPM
> (since only DIPM would have been enabled without this quirk anyway).
> 
> 
>> Yes the most severe problems do seem to come from that specific mix,
>> although the long list of other ATI controller quirks also shows those
>> controllers are somewhat finicky.
> 
> Definitely!
> 
> 
> Kind regards,
> Niklas
> 


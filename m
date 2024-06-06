Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A15199E91
	for <regressions@lists.linux.dev>; Thu,  6 Jun 2024 18:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717697569; cv=none; b=W1Sstljjgua+N/kCtQTBwWRmDKPt+kwagylcCmlzLADxEwOdjCeW2KBH1ihr9/dWt7+CAGskxBdbbJRfQAMHppzZFk5Z67UheVSoFFhGutuStdseihn0uFR8AALDd8tObhFROMoU+5yg8wlvD32HSJbD+zq0cn1VB5iYuMyvqKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717697569; c=relaxed/simple;
	bh=g18wcZ4Vrm3OPpEKR5GaSFXC3qL8zJOqLvXNZzYFeuM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LuqRiROV/NZ77Sd0tVbrOv7WH3MD59uLpudBKzp1T5CjZrj5staMQkjqyFLgZZ2/EDyn3lWBKkHBvbOlFeBsUeK8bXsBLrjeaSU37l5TChW33wytX0y98cOQL6Tsbc2RGJHtmnvExeMk5Z8sHNa12VJCjELbgjIVoA237Ei0Sa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QuKXJKPT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QuKXJKPT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717697567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KeMRLeH8AVI7a9rTTiY6E9/CXZa2WPt/Gto/LcU6z5E=;
	b=QuKXJKPTY9qFTTyyJKR/8PHa9dAfJYxOmzgwYCthfJi8ZQTGB7ujXiOY9L6FWHNzlb58AQ
	e8AjLgs4vjSyCKLKhD3JMTAz9R4UHx8QxRBf2x8GQcOrBHba1HXG5w780xeLVXGN3u/Td2
	KsTUKqL691RZyxCvjNX70wUWuNemNUw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-9Lrfaq-TNtO-92xMIllTtA-1; Thu, 06 Jun 2024 14:12:41 -0400
X-MC-Unique: 9Lrfaq-TNtO-92xMIllTtA-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2eab0fe8a7eso10956921fa.1
        for <regressions@lists.linux.dev>; Thu, 06 Jun 2024 11:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717697560; x=1718302360;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KeMRLeH8AVI7a9rTTiY6E9/CXZa2WPt/Gto/LcU6z5E=;
        b=gmcZlE7mEHmCirxXuLqUbPGi7rP3vzlcAr1fYELGsDXIjjfeuOaK5FSN2ykgKCCqpu
         XA23SW8CqzPFvmrratkWsmOeQn0WUxSSciNRUALxU58LtgWMK5p0pyeXAxpbBvoNaSGp
         z91YY96idjJnqV/5mf0LXdq+DomdWX4hpWjV7XnnqfjdNdFhdcM0vs/fehA2+ESMffLg
         bftLOzwVeAnJlzX1yLwWYesMjS0ZJYok/8xssNhR1vcw5VTvSOi76/4u+gCM02BbVDCg
         4amVL+NxC6GIWky6m6GSteKiqfgKn4Ka7PNLSjbClCc91bDnAmSzmMhZUgOO0ZPDQUFv
         9wKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhUmOiX2wmPejmASzvr62f+2IaNsC165L2mC4FpR/3HXKw2E89hU+2WKl4YIfdnCHg9eaudGa3OELo9rCN3sb4W7CJ6VTFmPVeRgo=
X-Gm-Message-State: AOJu0YxaAGq5RiivirtTC1fw5Sa6Bac2xLgzwB1MDaLGcjQWCs89Vxt5
	9k+1ie6b2W1O47YfRjfpsORB7EmASLdTveW1G2p4ndKhhQ1d7aeYH5eJ9pAsJGrFPnj9491aC6M
	ZL2537lC4c5jOuugGrqUaZtEhWmFU0GOgQplFg7hoSdk5rKDE9dXR33wamZVX
X-Received: by 2002:a2e:be0d:0:b0:2ea:bc04:9876 with SMTP id 38308e7fff4ca-2eadce712d0mr3648061fa.38.1717697560061;
        Thu, 06 Jun 2024 11:12:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEA8ZzHNP1/hcWkbYv2OrPty7pGVWuhlHWVUFyoEu0CW/LdPcqaEzki1tsMBhjPdaeTrSwq3Q==
X-Received: by 2002:a2e:be0d:0:b0:2ea:bc04:9876 with SMTP id 38308e7fff4ca-2eadce712d0mr3647841fa.38.1717697559679;
        Thu, 06 Jun 2024 11:12:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57aae13dc46sm1465248a12.52.2024.06.06.11.12.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 11:12:38 -0700 (PDT)
Message-ID: <e9062095-b312-44df-a9e3-0b09f3ec9eff@redhat.com>
Date: Thu, 6 Jun 2024 20:12:37 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ACPI: scan: Ignore Dell XPS 9320 camera graph port
 nodes
From: Hans de Goede <hdegoede@redhat.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Genes Lists <lists@sapience.com>, "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
 wentong.wu@intel.com, linux-media@vger.kernel.org,
 linux-acpi@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <988e48090982c89ce0c906954832fdfb09a1ce34.camel@sapience.com>
 <20240528084413.2624435-1-sakari.ailus@linux.intel.com>
 <a05df025-a0be-49cd-84a9-7d7fb2eeb33e@redhat.com>
In-Reply-To: <a05df025-a0be-49cd-84a9-7d7fb2eeb33e@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

+To: Rafael since this was Cc-ed to linux-acpi but never send
to Rafael directly.

Rafael this fixes a crash in 6.10-rc1 for some users and is necessary
to make the cameras work on the Dell XPS 13 plus 9320 .

On 5/28/24 7:09 PM, Hans de Goede wrote:
> Hi Sakari,
> 
> On 5/28/24 10:44 AM, Sakari Ailus wrote:
>> Ignore camera related graph port nodes on Dell XPS 9320. They data in BIOS
>> is buggy, just like it is for Dell XPS 9315. The corresponding software
>> nodes are created by the ipu-bridge.
>>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> ---
>> Hi,
>>
>> Could you test this and see whether it fixes the warning?
>>
>> The camera might work with this change, too.
> 
> Thank you I just received a Dell XPS 13 plus 9320 myself to use
> for VSC testing and I can confirm that with this patch 6.10.0-rc1
> works, including giving a picture with the libcamera software ISP +
> 3 small libcamera patches.

I forgot to add:

Tested-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




>>  drivers/acpi/mipi-disco-img.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/acpi/mipi-disco-img.c b/drivers/acpi/mipi-disco-img.c
>> index d05413a0672a..bf9a5cee32ac 100644
>> --- a/drivers/acpi/mipi-disco-img.c
>> +++ b/drivers/acpi/mipi-disco-img.c
>> @@ -732,6 +732,12 @@ static const struct dmi_system_id dmi_ignore_port_nodes[] = {
>>  			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 9315"),
>>  		},
>>  	},
>> +	{
>> +		.matches = {
>> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "XPS 9320"),
>> +		},
>> +	},
>>  	{ }
>>  };
>>  


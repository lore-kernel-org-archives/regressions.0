Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048461DFC6
	for <regressions@lists.linux.dev>; Wed, 12 Jun 2024 14:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718202639; cv=none; b=EFDF3hhOzcR+XouY9AwYL265LGDIpykuCP89hB+HicdoFnO0NwD1FVpSH8PPyE7eI8/3ydkMYE4JPlxPmqAyH2sH936eQXaVXy+TC2v9AuC7R2YoZAfa3DgmR1/09HQkGn7Ei/77ZBN1yEkmrWh0xhZf/9KfD5O0qFxia+JbFfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718202639; c=relaxed/simple;
	bh=omVuMBlaT5AMCk0cexHVckQ2Ggh1LZCOqB+0UbKNKTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQWaOHSe6okWYXMSGEUIuF1j7G6PvZZQ9VIjm/CHq/YvququxE70LI4CFX/jpBuOwb6XFD4ZqTePexzXwDpKziFtvG62jVW2PCdW023/4J40asGqs2iUcn97iCSRCCe7cnDMWIzMUxCoFzkyElvs6MDFRhsQRkPCOmVSuUXhGcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NkL7A9qb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NkL7A9qb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718202636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7cS4ThBUI4Xo4JscUapqaa6SdJC6quegytR0DPM0irQ=;
	b=NkL7A9qbRk7AcpMKitm+V4M7rE8wtLeB7p1uAmSUarWAwf7bxlEFMVyDf2oXcVvImE2X9q
	wf8pbDXiJKHNL9G8mx/nbIfeO+Wjxli0ewh/aai7RE9yzmGnlj0nyLzcNoj7DFLO48YXed
	dlY7zNHVQb3UKa5R/SP/O3kfsnHWqY0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-450-R7qTF0lKM5KH1rxck1oDFQ-1; Wed, 12 Jun 2024 10:30:35 -0400
X-MC-Unique: R7qTF0lKM5KH1rxck1oDFQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a6f1db7e425so158167566b.1
        for <regressions@lists.linux.dev>; Wed, 12 Jun 2024 07:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718202632; x=1718807432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7cS4ThBUI4Xo4JscUapqaa6SdJC6quegytR0DPM0irQ=;
        b=hZNCUkywCgH8g1DdXZ7PvmMKoB+OHAuOzUvAtNMlrU4qkTAsPQNarQouZU7plV16lP
         3fyxVCVfRzObb5Z7PFDxRkpxXOd+QZjRywaBigdBqIojqljEoiu0S5BT4cFxOtRIQoXd
         iPic0mWT/doB8epIomJSexb4tNCw02PJXboPxzikYGjj0YQrKs8kgg26IbdG/4FCLJmU
         uVTOAqwvZX2DHhozYR2PtaDGqmOGjV8s6RI3TcE4EnWe6lg0fpKsjVtNg/ZDuYw/n58O
         bN3C9QvVJtY7QjA2uwfGm8e4zTAKFAnIDRMX2UScihJrttw6gjTkQbSEgshI1F3q5mdD
         ac1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvIX/8j4tbtSwsoeOTdq9QpdeCHdbyNZhWyrV930ZB05ahlgOo/4dw+aMPMAqL/MaYGEFkyOs2eGnfqzx/vGmyPOJ9aPa+KEN1huM=
X-Gm-Message-State: AOJu0YxRkfBjYXBXxYb54QWCKY0sK9NTXTSjWh2RmAXk36PcScAkCQkZ
	cyTpUo5Uck6tIELgMcgbgK7yx/qaWHQqhZ4XoEH1EeXB63d1BVEOIjlA0eDYDAM+4sNqeOoJOEZ
	7mSmNKxKpBldwckKWPd8cd2X/Zqh+O+p8761snPFzpzwb5EPGMCiWmqA40uzB
X-Received: by 2002:a17:906:f898:b0:a6a:ab5:6f2a with SMTP id a640c23a62f3a-a6f47d4ecd1mr158153366b.11.1718202632657;
        Wed, 12 Jun 2024 07:30:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJZ0eUGcRzaFsAw7u/yrIlzSPl8IzB/sOG7rf5G+apo1abS+Lllru3dk+tOiIjb63LeigqTA==
X-Received: by 2002:a17:906:f898:b0:a6a:ab5:6f2a with SMTP id a640c23a62f3a-a6f47d4ecd1mr158150466b.11.1718202632188;
        Wed, 12 Jun 2024 07:30:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f1226c190sm511327466b.93.2024.06.12.07.30.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 07:30:31 -0700 (PDT)
Message-ID: <18cb82bb-51c6-4a52-80a4-6b1e3d95f99c@redhat.com>
Date: Wed, 12 Jun 2024 16:30:30 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ACPI: scan: Ignore Dell XPS 9320 camera graph port
 nodes
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Genes Lists <lists@sapience.com>, linux-kernel@vger.kernel.org,
 mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 laurent.pinchart@ideasonboard.com, wentong.wu@intel.com,
 linux-media@vger.kernel.org, linux-acpi@vger.kernel.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <988e48090982c89ce0c906954832fdfb09a1ce34.camel@sapience.com>
 <20240528084413.2624435-1-sakari.ailus@linux.intel.com>
 <a05df025-a0be-49cd-84a9-7d7fb2eeb33e@redhat.com>
 <e9062095-b312-44df-a9e3-0b09f3ec9eff@redhat.com>
 <4b387b4d-f778-4891-9f07-df5fc0a093cd@redhat.com>
 <ZmmQLt7wB-yGQBTw@kekkonen.localdomain>
 <CAJZ5v0ii3WFQRPdfHeeW4M9kXSWDVxxxy02zThcf25mjNwqDAw@mail.gmail.com>
 <ZmmT56Cyvb2FCyav@kekkonen.localdomain>
 <CAJZ5v0hOBggQR_=uA3VuhruQnZihVxHHovpTz4=qfcbiSunsYw@mail.gmail.com>
 <ZmmY3he9vfWVWU3I@kekkonen.localdomain>
 <CAJZ5v0j7HTfg1wY+B+7vhE6tBKPVHMuu_MsFHjaLK70VS_cNEw@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0j7HTfg1wY+B+7vhE6tBKPVHMuu_MsFHjaLK70VS_cNEw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/12/24 3:06 PM, Rafael J. Wysocki wrote:
> Hi Sakari,
> 
> On Wed, Jun 12, 2024 at 2:47 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
>>
>> Hi Rafael,
>>
>> On Wed, Jun 12, 2024 at 02:32:26PM +0200, Rafael J. Wysocki wrote:
>>>>>>> I just hit the same problem on another Dell laptop. It seems that
>>>>>>> all Dell laptops with IPU6 camera from the Tiger Lake, Alder Lake
>>>>>>> and Raptor Lake generations suffer from this problem.
>>>>>>>
>>>>>>> So instead of playing whack a mole with DMI matches we should
>>>>>>> simply disable ACPI MIPI DISCO support on all Dell laptops
>>>>>>> with those CPUs. I'm preparing a fix for this to replace
>>>>>>> the DMI matching now.
>>>>>>
>>>>>> DisCo for Imaging support shouldn't be dropped on these systems, and this
>>>>>> isn't what your patch does either. Instead the ACPI graph port nodes (as
>>>>>> per Linux specific definitions) are simply dropped, i.e. this isn't related
>>>>>> to DisCo for Imaging at all.
>>>>>
>>>>> So it looks like the changelog of that patch could be improved, right?
>>>>
>>>> Well, yes. The reason the function is in the file is that nearly all camera
>>>> related parsing is located there, not that it would be related to DisCo for
>>>> Imaging as such.
>>>
>>> So IIUC the camera graph port nodes are created by default with the
>>> help of the firmware-supplied information, but if that is defective a
>>> quirk can be added to skip the creation of those ports in which case
>>> they will be created elsewhere.
>>>
>>> Is this correct?
>>
>> Yes.
> 
> So it would be good to add a comment to this effect to
> acpi_nondev_subnode_extract() where acpi_graph_ignore_port() is
> called.
> 
> And there is a somewhat tangential question that occurred to me: If
> the nodes are created elsewhere when acpi_graph_ignore_port() is true,
> why is it necessary to consult the platform firmware for the
> information on them at all?  Wouldn't it be better to simply always
> create them elsewhere?

That is a good question. The ACPI MIPI DISCO specification is an
attempt standardize how MIPI cameras and their sensors are described
in ACPI.

But this is not actually being used by any Windows drivers atm. The windows
drivers rely on their own custom ACPI data which gets translated into
standard Linux device-properties by: drivers/media/pci/intel/ipu-bridge.c 

and so far AFAIK there are 0 laptops where there actually is 100% functional
ACPI MIPI information. I believe that some work is in place to get correct
usable ACPI MIPI information in place in the ACPI tables of some Meteor Lake
laptops. But I believe that there too it does not work yet with the BIOS
version with which current Windows models are shipping. It is being fixed
for systems which have Linux support from the vendor but I suspect that
on other models if ACPI MIPI DISCO information is there it will not
necessarily be reliable because AFAICT Windows does not actually use it.

And TBH this has me worried about camera support for Meteor Lake devices
going forward. We really need to have 1 reliable source of truth here and
using information which is ignored by Windows does not seem like the best
source to use.

Sakari I know you have been pushing for MIPI camera descriptions under
ACPI to move to a standardized format and I can see how that is a good
thing, but atm it seems to mainly cause things to break and before
the ACPI MIPI DISCO support landed in 6.8 we did not have these issues,
since the information used by the ipu-bridge code does seem to be correct.

Regards,

Hans



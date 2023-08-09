Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7936C24503
	for <regressions@lists.linux.dev>; Wed,  9 Aug 2023 19:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691608825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYJARn+Tr8oo6UNssY2uogwaQ1veOX4LdfLq6I1sIi0=;
	b=GpFWoA4noun05sXXu7hal0LWdvtPYTYKjCQvsgXd5UwjHnPqCWUnQ45tsc81SAouVkAcG4
	r8zXt3KElfCvuCLW1rBSLrcGzfK1y4btTVGJosgEHCwu58+xc1icIIXzDJiKTQFV3TsU9o
	eJIZeRCfEb3KzhyKeDZM5NoZbRKQ5tY=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-qUFkKa2nOruryru_r2S2cw-1; Wed, 09 Aug 2023 15:20:23 -0400
X-MC-Unique: qUFkKa2nOruryru_r2S2cw-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-4fe565bca92so77389e87.0
        for <regressions@lists.linux.dev>; Wed, 09 Aug 2023 12:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691608822; x=1692213622;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NYJARn+Tr8oo6UNssY2uogwaQ1veOX4LdfLq6I1sIi0=;
        b=S/lbTSynhVFObXfO/VK9JL0pxZuGPJ/2MJiJtXphB/iqmkCZlEz9hfbrdDA7gJ7Iy6
         aDOLVWqWRUvrwcQztLLELzhzEwiAs4zyvhirWsqQSlntqxUWmKHKn5r4HSwVI2NvldP4
         DzsQtrsa5Yk2zNGfiQ2SVTUEq2iWhYwAFkm9X7A8pkx6v1xuUgy9t7v652TpKiAFakHi
         3mKMyFq8Jr5W162PzNrZheMkv909vNn8SS7sJGQjbA1uLNto+6Yt5sGbsABu9yirOwGV
         yNX3vzKP06mU3rSrZqGH18yFcDlmiV6D7wM0MA6JCrmZiAEqp07AVE//7O05WQTpSl5E
         g7QQ==
X-Gm-Message-State: AOJu0YwvbYShUuc7gIuow6K0Wx1RO1FH1DxBrNycNry5Dg+xxk+YHgOh
	5Yq00wZaQTU0P9JBNm/haSjVMiOa+oaUfxnLCkMJTuUQela6tqXUhY6B8bewcXKmf+6RC/6rs+m
	I6lmXYWVf3NmsJuWajdDEr8Q=
X-Received: by 2002:a05:6512:6d5:b0:4fe:825:a081 with SMTP id u21-20020a05651206d500b004fe0825a081mr44164lff.45.1691608822370;
        Wed, 09 Aug 2023 12:20:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtu6F06SjXUXLKVgFHropPatS+pATl3bG4JmLunyJmmo8QQwzISppJhRNnKn08hjruOqg3Cg==
X-Received: by 2002:a05:6512:6d5:b0:4fe:825:a081 with SMTP id u21-20020a05651206d500b004fe0825a081mr44145lff.45.1691608822042;
        Wed, 09 Aug 2023 12:20:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p17-20020a1709066a9100b009887f4e0291sm8302774ejr.27.2023.08.09.12.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 12:20:20 -0700 (PDT)
Message-ID: <c3684f00-27bd-d4dd-93dd-18936c006de9@redhat.com>
Date: Wed, 9 Aug 2023 21:20:20 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/3] ACPI: resource: Honor MADT INT_SRC_OVR settings
 for IRQ1 on AMD Zen
To: August Wikerfors <git@augustwikerfors.se>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 stable@vger.kernel.org, linux-acpi@vger.kernel.org, x86@kernel.org
References: <20230809085526.84913-1-hdegoede@redhat.com>
 <20230809085526.84913-4-hdegoede@redhat.com>
 <6a6fa2ba-c07d-45b2-96c5-b0f44f5f288b@augustwikerfors.se>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6a6fa2ba-c07d-45b2-96c5-b0f44f5f288b@augustwikerfors.se>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8/9/23 17:58, August Wikerfors wrote:
> On 2023-08-09 10:55, Hans de Goede wrote:
>> On AMD Zen acpi_dev_irq_override() by default prefers the DSDT IRQ 1
>> settings over the MADT settings.
>>
>> This causes the keyboard to malfunction on some laptop models
>> (see Links), all models from the Links have an INT_SRC_OVR MADT entry
>> for IRQ 1.
>>
>> Fixes: a9c4a912b7dc ("ACPI: resource: Remove "Zen" specific match and quirks")
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217336
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217394
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217406
>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>> Cc: Linux regressions mailing list <regressions@lists.linux.dev>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> One of the laptops fixed by a9c4a912b7dc, PCSpecialist Elimina Pro 16 M [1], seems to have no INT_SRC_OVR entry for IRQ 1 [2]:
> 
>> [    0.084265] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
>> [    0.084266] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
> 
> I'm not sure if it was IRQ 1 that needed to be overridden for that model though, so it may work anyway with patch 2 of this series.
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=217394#c18
> [2] https://bugzilla.kernel.org/attachment.cgi?id=304338

Good catch, thanks. So it looks like this one needs a DMI quirk (until we have a better generic solution.

I'll reach out to the reporter and ask for dmidecode output and prepare a follow-up patch. Still I think that we should move forward with this series to fix the 6 bugs which are linked to from PAtch 1's commitmsg and those are likely just the top of the iceberg.

Regards,

Hans


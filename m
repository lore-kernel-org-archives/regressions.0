Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D848489
	for <regressions@lists.linux.dev>; Sat,  5 Aug 2023 13:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691240969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ehu/P9kMK+ANcrbIAM1h/zk8lNfm0lCws3biHgn8nz4=;
	b=CI0jo9MBKoaQvqrtnuQzaNyo4VYwgHlISi0CzkMczdFqXkqrOx2UHE9kigwAx7CMFWOc9m
	tpy2lrrTG0zefi6t7w1QLhsV7fFoRzsEhohEGD6pYVeoUqVtda91KRRngtaK2s9JqlT1S/
	5+uupAT10759SqDwt7zuiJNNc6vU2E8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-QUslEV5KNemeb0GB4r_mHw-1; Sat, 05 Aug 2023 09:09:28 -0400
X-MC-Unique: QUslEV5KNemeb0GB4r_mHw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-99bc8f1290eso196341266b.3
        for <regressions@lists.linux.dev>; Sat, 05 Aug 2023 06:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691240967; x=1691845767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ehu/P9kMK+ANcrbIAM1h/zk8lNfm0lCws3biHgn8nz4=;
        b=GqYi7TuxpO6xzgSIAMHOuLO//35gph/qjbTRR5zDpSQO1ztEFCjnr59ZKMc7cAWrnK
         lY0lQOXUXQiKkNHJdO4HOb0Ewm9JKrPm2mn/A4IlwdEAthB7BpxafKvMy3vHQjCFdlO5
         60JX1ex/ioKNou0PR/iXPAn0cNkg2r8kw7nhPsNO5+KiBRJ/w41e1C/0BQJ8V7eXo3RA
         EnwI8GrPTLrryuEerGJZ0dGiWPlqEQpfs0n5Vuyjre9TK4hzlkuO0S15FUF4dVdyEWo5
         aFxRFSB5uWiPkj7G+GtXncPiIokWxV1K59wHweNaOhX+HWS05JldcFJt/jPCFozCVni0
         X0tA==
X-Gm-Message-State: AOJu0YwDeMRcs+uFPf4K3KAXEKwdmVQa2dG18ZonVQibjs/kjOcEGw4g
	75/gYsMZWIBxCMNeFcFGsQsfEH1buUkxMm34joxztVoDvVA+5K+P/2jZQYnZrhlusUIfU7yAmRD
	LhjzFvif2qpBSbrmajv9ds3c=
X-Received: by 2002:a17:906:cc0f:b0:99b:f03d:de37 with SMTP id ml15-20020a170906cc0f00b0099bf03dde37mr3201767ejb.60.1691240966971;
        Sat, 05 Aug 2023 06:09:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxTUJ6UfA+ygtRAtwWtx1Jz30S537FK+47etHoPWUHMHvqfERQhu5bImDIb6Ym41ie3dNhlA==
X-Received: by 2002:a17:906:cc0f:b0:99b:f03d:de37 with SMTP id ml15-20020a170906cc0f00b0099bf03dde37mr3201754ejb.60.1691240966704;
        Sat, 05 Aug 2023 06:09:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kg12-20020a17090776ec00b0098951bb4dc3sm2666439ejc.184.2023.08.05.06.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 06:09:25 -0700 (PDT)
Message-ID: <cc9e37b4-b5cb-fd4d-84b8-5b824afe710a@redhat.com>
Date: Sat, 5 Aug 2023 15:09:25 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Fwd: 6.5 - 6.4.7 Regression : ASUS UM5302TA Keyboard don't work
To: August Wikerfors <git@augustwikerfors.se>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Linux Input Devices <linux-input@vger.kernel.org>,
 ACPI Asus <acpi4asus-user@lists.sourceforge.net>,
 Linux x86 Platform Drivers <platform-driver-x86@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>,
 Guilhem Lettron <guilhem@lettron.fr>
References: <bdc6cb4d-a853-72b2-b132-989b64740ad9@gmail.com>
 <8ee87fe1-684f-ad59-21c7-4401a4e70bee@leemhuis.info>
 <b7df9a02-3b81-4f8c-aeba-222c298180d4@augustwikerfors.se>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b7df9a02-3b81-4f8c-aeba-222c298180d4@augustwikerfors.se>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/4/23 17:26, August Wikerfors wrote:
> On 2023-07-30 06:49, Linux regression tracking (Thorsten Leemhuis) wrote:
>> Lo!
>>
>> On 30.07.23 04:41, Bagas Sanjaya wrote:
>>>
>>> I notice a regression report on Bugzilla [1]. Quoting from it:
>>>
>>>> On a kernel 6.4.5 and less, the keyboard is working fine.
>>>>
>>>> Beginning with 6.5 rc1 and 6.4.7 any key don't respond.
>>
>> That is a AMD Ryzen Laptop. And if that really started from
>> v6.4.6..v6.4.7 then I guess there is a decent chance that this is caused
>> by ```ACPI: resource: Remove "Zen" specific match and quirks``` from
>> Mario. Hence adding him to the list of recipients.
> 
> Confirmed now, see https://bugzilla.kernel.org/show_bug.cgi?id=217726#c9
> 
> #regzbot introduced: a9c4a912b7dc7ff922d4b9261160c001558f9755

We just have received 2 bug reports for Fedora which I believe are also
this issue (not confirmed yet):

https://bugzilla.redhat.com/show_bug.cgi?id=2229165
https://bugzilla.redhat.com/show_bug.cgi?id=2229317

I'm going to create a Fedora 6.4.y test-kernel with a9c4a912b7dc7ff
reverted.

IMHO we really should revert a9c4a912b7dc7ff upstream,
at least for the 6.4.y series where it seems to be doing
more harm then good.

And propably also for 6.5-rc# for now until we figure out
a better solution.

Regards,

Hans



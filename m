Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66795221
	for <regressions@lists.linux.dev>; Mon,  9 Jan 2023 21:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673298894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TFZjjWis11GFBdGRfw4ckgxzH8gAgz/JcfmlSBC9SCo=;
	b=hhwzH0xNnI+2EE6gunJfIDm/sq6/ko3ocC9IayG4ZK6I+QA3TkaS1ltf3uUoAK3CP7SavM
	Y9wPoP1tzS973IqrlMbHQWI528Gqpqyz8nssUOBOUYg+4T3ti6ay3mjmuXMzED7ddIdlPm
	a6WM6Dcnv55vakZ3KHs243eP2ZTIG3U=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-iAOo08Q1PkWa7MBK5RjHkg-1; Mon, 09 Jan 2023 16:14:53 -0500
X-MC-Unique: iAOo08Q1PkWa7MBK5RjHkg-1
Received: by mail-ed1-f72.google.com with SMTP id z20-20020a05640240d400b0047028edd264so6158301edb.20
        for <regressions@lists.linux.dev>; Mon, 09 Jan 2023 13:14:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TFZjjWis11GFBdGRfw4ckgxzH8gAgz/JcfmlSBC9SCo=;
        b=EmGojMqSnGR0yHenoKK/F4KG56UxzszAOnuXfXRxcsLsBgausfUoOT1yEgiNylZ8yb
         hwQy0RJA06WmzXW8KnbqzrE1hcq7qv0oWuFj9kbDy7wxT0WxQamF3hVytx5qXqevM5Ok
         ZONI5wqFS1TItbaiU5bPhsLSKn11B5c9xnJWEjHxiszVcW/R+JjjwEYowSsnnveq22kv
         Gfm2KnNZq/mSzi0aalHYnOk6vWZHcUb+PsWiT88g4cOssk2pcQFP97TiJNbWavWNrST2
         r37olN54JDhLk9436B8UQrtDp1IdByv/QO4M/a6PiA0g807/piLEzCQFPx8mzRQh8MFe
         75Nw==
X-Gm-Message-State: AFqh2kosAL9wCrKNPFbMIGJPMJNlfRVGeyPb9VH4XI30eH+5rM8p746b
	KskX3eLDm0DAL37XpRvBquWKYdKc1q8ocjDgAMBQQG5CHuc8Cvgc8VdDVVjewPvmfCqXVPGtN0L
	ZzqYQQaV/A4tVYAkGGAtF+8k=
X-Received: by 2002:a17:906:37c8:b0:84d:2fce:f325 with SMTP id o8-20020a17090637c800b0084d2fcef325mr8187000ejc.49.1673298891139;
        Mon, 09 Jan 2023 13:14:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXty9f/SOo1KeDaQ7gnEOkCuJZFKZ116mudq5XcNBYeVBMcWowj083/EOk0IPXOacF+AvlCeVQ==
X-Received: by 2002:a17:906:37c8:b0:84d:2fce:f325 with SMTP id o8-20020a17090637c800b0084d2fcef325mr8186987ejc.49.1673298890907;
        Mon, 09 Jan 2023 13:14:50 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id la16-20020a170907781000b0084d494b24dcsm1519339ejc.161.2023.01.09.13.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 13:14:50 -0800 (PST)
Message-ID: <1385de27-1a13-b36f-b255-4e6b016453d7@redhat.com>
Date: Mon, 9 Jan 2023 22:14:49 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ACPI: Fix selecting the wrong ACPI fwnode for the iGPU on
 some Dell laptops
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>,
 linux-acpi@vger.kernel.org
References: <20230109205721.60694-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230109205721.60694-1-hdegoede@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

p.s.

This fixes a regression in 6.1, adding the regressions list to the Cc.

Once we figure out the best way to fix this (this patch is more of a proposal
how to fix this rather then a definitive fix), we should also backport
the fix to 6.1.y.


On 1/9/23 21:57, Hans de Goede wrote:
> The Dell Latitude E6430 both with and without the optional NVidia dGPU
> has a bug in its ACPI tables which is causing Linux to assign the wrong
> ACPI fwnode / companion to the pci_device for the i915 iGPU.
> 
> Specifically under the PCI root bridge there are these 2 ACPI Device()s :
> 
>  Scope (_SB.PCI0)
>  {
>      Device (GFX0)
>      {
>          Name (_ADR, 0x00020000)  // _ADR: Address
>      }
> 
>      ...
> 
>      Device (VID)
>      {
>          Name (_ADR, 0x00020000)  // _ADR: Address
>          ...
> 
>          Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
>          {
>              VDP8 = Arg0
>              VDP1 (One, VDP8)
>          }
> 
>          Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
>          {
>              ...
>          }
>          ...
>      }
>  }
> 
> The non-functional GFX0 ACPI device is a problem, because this gets
> returned as ACPI companion-device by acpi_find_child_device() for the iGPU.
> 
> This is a long standing problem and the i915 driver does use the ACPI
> companion for some things, but works fine without it.
> 
> However since commit 63f534b8bad9 ("ACPI: PCI: Rework acpi_get_pci_dev()")
> acpi_get_pci_dev() relies on the physical-node pointer in the acpi_device
> and that is set on the wrong acpi_device because of the wrong
> acpi_find_child_device() return. This breaks the ACPI video code, leading
> to non working backlight control in some cases.
> 
> Make find_child_checks() return a higher score for children which have
> pnp-ids set by various scan helpers like acpi_is_video_device(), so
> that it picks the right companion-device.
> 
> An alternative approach would be to directly call acpi_is_video_device()
> from find_child_checks() but that would be somewhat computationally
> expensive given that acpi_find_child_device() iterates over all the
> PCI0 children every time it is called.
> 
> Fixes: 63f534b8bad9 ("ACPI: PCI: Rework acpi_get_pci_dev()")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/acpi/glue.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/acpi/glue.c b/drivers/acpi/glue.c
> index 204fe94c7e45..2055dfd7678b 100644
> --- a/drivers/acpi/glue.c
> +++ b/drivers/acpi/glue.c
> @@ -75,7 +75,7 @@ static struct acpi_bus_type *acpi_get_bus_type(struct device *dev)
>  }
>  
>  #define FIND_CHILD_MIN_SCORE	1
> -#define FIND_CHILD_MAX_SCORE	2
> +#define FIND_CHILD_MAX_SCORE	3
>  
>  static int match_any(struct acpi_device *adev, void *not_used)
>  {
> @@ -89,15 +89,25 @@ static bool acpi_dev_has_children(struct acpi_device *adev)
>  
>  static int find_child_checks(struct acpi_device *adev, bool check_children)
>  {
> +	int score = FIND_CHILD_MIN_SCORE;
>  	unsigned long long sta;
>  	acpi_status status;
>  
>  	if (check_children && !acpi_dev_has_children(adev))
>  		return -ENODEV;
>  
> +	/*
> +	 * For devices without a _STA method, prefer devices without a _HID
> +	 * (which conflicts with having an _ADR) but which have been matched
> +	 * in some other way, like e.g. by acpi_is_video_device() over devices
> +	 * with no ids at all.
> +	 */
> +	if (!adev->pnp.type.platform_id && adev->pnp.type.hardware_id)
> +		score++;
> +
>  	status = acpi_evaluate_integer(adev->handle, "_STA", NULL, &sta);
>  	if (status == AE_NOT_FOUND)
> -		return FIND_CHILD_MIN_SCORE;
> +		return score;
>  
>  	if (ACPI_FAILURE(status) || !(sta & ACPI_STA_DEVICE_ENABLED))
>  		return -ENODEV;


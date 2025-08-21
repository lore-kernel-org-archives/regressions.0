Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B65334392
	for <regressions@lists.linux.dev>; Thu, 21 Aug 2025 13:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755782977; cv=none; b=IWjpN3Bcyz2NeiKEtu4/AhWI9VU6WmcYBiT3trVD/UiorkoAMMLL2Tq5jtTML+utQ0oS7NzOHIzpyb4r03c3MMnBWwVmK1bCbjIKd/dSQmxKchLhQFMlOepOArM98eSSs+nKeNqBsRhT3QpDHdAC14+VDxKfGqJDa/z19R8fbxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755782977; c=relaxed/simple;
	bh=wc5v9uTTIL728+hB7UJTKaDvwgtQwqhmi3Vl/hFU5ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZdbFSrBANc4gu8VZrmWt5ByjSR0ZXhj5JDmNNW8qgI2Hh/b9Mvoz3W1B5DPkSxS5Cdjambs6rXxd5LO3IEW8WwZRRENCXJqWGr+ZIDVlxw7VQeG+POsk+ESF5vm8X6O0wssd/RupY3REHQJ6NECcObUwexKVLYf1+h0WZdVTlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=adqU2xFW; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="adqU2xFW"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-246013de800so135675ad.0
        for <regressions@lists.linux.dev>; Thu, 21 Aug 2025 06:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755782975; x=1756387775; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J13Esd7nTONrArlNpUKcH+9/JHXUHsKEy/Ib89aPaCQ=;
        b=adqU2xFWHawl1rffDXfXy/+Wd76a8FEs7T6fp+NXvC5xgYxFsGmAkCWY/h1v5bGBba
         Io4lVz7qUct0kp6L2jroVzM+TaEVUCfFYTKSDonU/gCDFMmsbeTvWT3jydi+YXH1bLle
         ffZo1kZ50t9FHLY582cFo3DheDHR+ladD1VDvgl/U3KC0AuWUs9fxG94qifCCnePWtBg
         OSWKQcgosQYZyG9i+HngJepwGioSDB7jCTrk7WGjd9er2Y3V3CZAzzIIJIf1UJCHXNCK
         UTz1Rvk60odaSgmOrcOI19oGYXmqB3MZt268GZRqoD1PxB7zElKW358rbOUYUsjVifc4
         7drA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755782975; x=1756387775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J13Esd7nTONrArlNpUKcH+9/JHXUHsKEy/Ib89aPaCQ=;
        b=QI3P6kGG8tnZuj4T0ySpBMDeMe8uQoQlEtxfQFnjCXdH9VW7YA2nhvxD3nhGlQ8Wak
         RnN/FWJNTnlSClBMrMySKVZTErzuGOo5VXfSzTbQqgM2xjpfhd52DQJoxSc4f3KYIfRe
         DqHI6txl3nhf1WLYZuGZp3bpJoxPqlzQouNPk2VZO82kQ1t6bo/krTWVmH7Kl51Lq2uz
         ngETyeSmzmR2yGZLhygrgFuj12twRhYb9tEnqaEhHNjkCjQ33+pwXHhPQSZI2E+ZOrkJ
         kuwe3Ogm+DohZm8QEu50JIT6R+ohRQ3hIDW3jzx0c/oQTthnhzcJXUU4Lqif6ccW5Tbj
         1/+A==
X-Forwarded-Encrypted: i=1; AJvYcCWESpw/qLaHMXk3Hqfl75woiGKb6IVzhUum+suCM1PbicrApUWVooNI/bx0Z+hHjeXI213Q6iKy/470Ug==@lists.linux.dev
X-Gm-Message-State: AOJu0YwTNaAzeEZ+18QRh8gMpQVss1qi21zKDgEfxzJDqe7T9LfCL9Y1
	o/DjeZqcmYX7BwxdWN4SvR7/xVsI4aetVkh/BGxM3C8Yzpb1FQCHFNaUKs1+orUfPg==
X-Gm-Gg: ASbGncs83forwA6bQ4mnSMMhQzGA+4RNFd1UdYM5x3bEvPDk6BFXCZEV17+fe21g2ma
	U3hm94XnNi0mQEyJqQoTzS7Xp4J6NzN4fLbAEOOuvrlKA2DD88aCO7Yy+2x4DwrDPFkVoM5ijOW
	Gv7q5sPOUiBSe5YIBHyDYbvA71myae9MAky5CZsxyyIJBXPvUh2AlanFnP1LNg0q80CS9G6hlBp
	EnlEp+32NgfQJAM9WhyOqKIzKP1PB5/wM2lgd+mAUBNs7NFIfNY7Z9rudXuZPlXZszXkXq4YlRz
	7NSAxtrzjGIZgdanp2GTfp9ohCe7ABacBKcNLjTeXWm6Q81H+sEnmTFtxpNWm/vNeksdPOMol/5
	3qFthMmCFuNYX1EYown+B96m3Xu/JdgUnxzXu9o5kpWVvPO+yGdDdUbKse9+IFw==
X-Google-Smtp-Source: AGHT+IEJ89+AicE1lZQ3XnhpL5tHd/m1IsnyOgUW94AR1BOA58fjSEzDksF9jqNKQwq8P3RC6Erj0g==
X-Received: by 2002:a17:903:166e:b0:234:b441:4d4c with SMTP id d9443c01a7336-24602317afcmr3273645ad.5.1755782975217;
        Thu, 21 Aug 2025 06:29:35 -0700 (PDT)
Received: from google.com (3.32.125.34.bc.googleusercontent.com. [34.125.32.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d4fd2f5sm8344077b3a.74.2025.08.21.06.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:29:34 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:29:29 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Li Li <dualli@google.com>, Tiffany Yang <ynaffit@google.com>,
	John Stultz <jstultz@google.com>, Shai Barack <shayba@google.com>,
	=?iso-8859-1?Q?Thi=E9baud?= Weksteen <tweek@google.com>,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Todd Kjos <tkjos@android.com>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"open list:NETWORKING [GENERAL]" <netdev@vger.kernel.org>,
	Martijn Coenen <maco@android.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	Alice Ryhl <aliceryhl@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v20 3/5] binder: introduce transaction reports via netlink
Message-ID: <aKcfOXcutUwoivDD@google.com>
References: <20250727182932.2499194-1-cmllamas@google.com>
 <20250727182932.2499194-4-cmllamas@google.com>
 <e21744a4-0155-40ec-b8c1-d81b14107c9f@leemhuis.info>
 <2025082145-crabmeat-ounce-e71f@gregkh>
 <ddbf8e90-3fbb-4747-8e45-c931a0f02935@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddbf8e90-3fbb-4747-8e45-c931a0f02935@leemhuis.info>

On Thu, Aug 21, 2025 at 03:00:50PM +0200, Thorsten Leemhuis wrote:
> On 21.08.25 14:19, Greg Kroah-Hartman wrote:
> > On Thu, Aug 21, 2025 at 10:49:09AM +0200, Thorsten Leemhuis wrote:
> >> On 27.07.25 20:29, Carlos Llamas wrote:
> >>> From: Li Li <dualli@google.com>
> >>>
> >>> Introduce a generic netlink multicast event to report binder transaction
> >>> failures to userspace. This allows subscribers to monitor these events
> >>> and take appropriate actions, such as stopping a misbehaving application
> >>> that is spamming a service with huge amount of transactions.
> >>>
> >>> The multicast event contains full details of the failed transactions,
> >>> including the sender/target PIDs, payload size and specific error code.
> >>> This interface is defined using a YAML spec, from which the UAPI and
> >>> kernel headers and source are auto-generated.
> >>
> >> It seems to me like this patch (which showed up in -next today after
> >> Greg merged it) caused a build error for me in my daily -next builds
> >> for Fedora when building tools/net/ynl:
> >>
> >> """
> >> make[1]: Entering directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/lib'
> >> gcc -std=gnu11 -O2 -W -Wall -Wextra -Wno-unused-parameter -Wshadow   -c -MMD -c -o ynl.o ynl.c
> >>         AR ynl.a
> >> make[1]: Leaving directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/lib'
> >> make[1]: Entering directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated'
> >>         GEN binder-user.c
> >> Traceback (most recent call last):
> >>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 3673, in <module>
> >>     main()
> >>     ~~~~^^
> >>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 3382, in main
> >>     parsed = Family(args.spec, exclude_ops)
> >>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 1205, in __init__
> >>     super().__init__(file_name, exclude_ops=exclude_ops)
> >>     ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/pyynl/lib/nlspec.py", line 462, in __init__
> >>     jsonschema.validate(self.yaml, schema)
> >>     ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^
> >>   File "/usr/lib/python3.13/site-packages/jsonschema/validators.py", line 1307, in validate
> >>     raise error
> >> jsonschema.exceptions.ValidationError: 'from_pid' does not match '^[0-9a-z-]+$'
> >>
> >> Failed validating 'pattern' in schema['properties']['attribute-sets']['items']['properties']['attributes']['items']['properties']['name']:
> >>     {'pattern': '^[0-9a-z-]+$', 'type': 'string'}
> >>
> >> On instance['attribute-sets'][0]['attributes'][2]['name']:
> >>     'from_pid'
> >> make[1]: *** [Makefile:48: binder-user.c] Error 1
> >> make[1]: Leaving directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated'
> >> make: *** [Makefile:25: generated] Error 2
> >> """
> > 
> > Odd, this works for me.
> 
> Hmmm, happened on various Fedora releases and archs in Fedora's coprs
> buildsys for me today. And with a local Fedora 41 x86_64 install, too;
> in the latter case (just verified) both when checking out next-20250821
> and 63740349eba78f ("binder: introduce transaction reports via netlink")
> from -next.
> 
> > How exactly are you building this?
> 
> Just "cd tools/net/ynl; make".
> 
> Ciao, Thorsten

Judging by the regex in the error log it seems there is a new
restriction to not using underscores in the yml files. This restriction
probably raced with my patch in next. It should be very easy to fix. Can
you please try replacing the underscores?

 $ sed -i 's/_/-/' Documentation/netlink/specs/binder.yaml

I think that should fix your build. I'll try to reproduce.

--
Carlos Llamas

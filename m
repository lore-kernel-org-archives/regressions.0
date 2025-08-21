Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DC02DF713
	for <regressions@lists.linux.dev>; Thu, 21 Aug 2025 13:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783543; cv=none; b=vFQU8D4aeSbS4WoXTfecZ/rKVmFAD6ul3Sk+gY6cGssQEuXPBYZl7uI5rcW+WCc9dQqLNdT4+b0AWJzVnOn/AZ6gxPgZSy/QkNq+EDRfBIUcZLZxT+mdmHrJoetgHFX2jqAJz2A1BdjfanghHQtJcrJWG9tlnS+IMUIJEF7t16A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783543; c=relaxed/simple;
	bh=UBaomgbe5Pto6k9s8jcQN8o0bdH3iMYe1oFhKjAp01M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5H6GhDWJe4auLUeNDpR18diL0Slw3jVmHukl6UrdisN1KLFxWVDsuCSyrXpHu1BI7NVkjZs0KiISny5Ih9ZSEZStT/mPvHh//6rQisCpIMabtMApVfh1v9wh5sKewcXhZM8cDDq8qy1baUXZwSMQBto2mcnI5z8EDdOoVRhZB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=geg9iDB8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="geg9iDB8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-246013de800so137805ad.0
        for <regressions@lists.linux.dev>; Thu, 21 Aug 2025 06:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755783541; x=1756388341; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7N9rAjjjlmmVnsb6lYyZUzYXQ/m0Q5K6qvsrUkhsgXc=;
        b=geg9iDB8OGFLJ7nZUez/Lzg6kXZ4lW2nwsFeG57yjk9WsR/ArCekhTJxlVVJwGUNlp
         rwZVCVKim0Co+vtUFggAnfbuhd4sNClqRtxLbaOiyFj2LlbhrMvtArF4Cezjc/bRhMPe
         7xU1TtWJNITE3NKcaOq3/k3GeKShwG1JIHiAP9qQMmX1B7CpDHueCBUCjVzVHdQq60i9
         fwgI7pudhRJ4IYq0IP2Sh0UV7UVdICg83g4r531MJY+FRg2orLRFRouCcGo1mV2NmhNi
         bn1uprGm1sX7fFoCUOiN7+YEO5x1vFLNAt9Aq6+fJNG4ic/LXzQYOE7TzUJ6FxOSHz1H
         DIlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783541; x=1756388341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7N9rAjjjlmmVnsb6lYyZUzYXQ/m0Q5K6qvsrUkhsgXc=;
        b=n9lKYQwY9kI/za0o2Pig3WG+/HbMM7M+trsc93M7ZJa7RpPC9HtKjekvv8k6R/QyoT
         LqHB4Gu8f5RQ8Xymf44R4wPjE0PdjgQ7CanC/Xyugf0S34Rr5PjZk0Sn/DwywJGlP+WC
         /bB1zo329g/WKRrvd8sGHth0IavFvLPzl1AnmfE1zjboU7gyvIbaFTgC5OvzzuHvgFAy
         i3EwKzn/iYo1vCH0+4bsRvXlE+0AuGfGrFtNwpnqF6OC+TAeFLoFUCOupnPcG4vOpjT7
         yYL5uZ7EM/XwLM/WNj3nx5Q3+lPM9iezWhWo0KaYS0CnCjJ+3Lt91H1BbwfBboga4fLS
         58wg==
X-Forwarded-Encrypted: i=1; AJvYcCVat85W3g+F9LTOCAFetri1YfQ2A3XHMZ23sPYfAS+qeeT20vjqTT80x8UV2E+PdcekPX7Mo40POtDRpg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy42LhzDbClyvLQKxbGPKBRnwY/L8BP/zelFYiLvy9DuJdQkmFO
	GXWggb9st/YlMnoUxk+YZMmQNksfKOqRAYhEZj+brQos4ucdGwkKQYOMoLD6Dat0rg==
X-Gm-Gg: ASbGncuFjVDPdD9Tf2YS31vR12KHO6og0ZCsm4W9PaPpe4U+EcTQ+TZrsFxijHI3Q3b
	wVsmNdf+/hNA6W/cBUogAtm62JRTPUQfh1KUI1WcQti+GmQU1AKr+Grz0LI2rOG4HkcXz4V7EDz
	GV08Cnu4hBvP5GdpltqoXTMDQD5TtIamIvUpICgDjsbtbLB4fRwuSlQ4hA3cfeX1SXAMg+VkAG3
	GMwfwEKofx0vAl7fhC5t5GiadjzwJ9mB5xtS6H2UhYypJ/CUKlRQkqnNHPgT0Tfs36KgNlgvoAM
	hkyQppmQqdcptIrMfRA+jQjLzH4ZYysCWBa6MntzTwhUFY8o9vRCfVSVvYMhY/pzGXz/QI/Oo6W
	ErGGw1kgOzLtTbN7UfQo1T/JXYdQGOzr9J/PdGX/Ck1Sc80+RUtYXdrlDqvTcHQ==
X-Google-Smtp-Source: AGHT+IEC07DRM954ZauhrF271W70UI0dmUDeDFMbKiMegLnkkgTzAWcZdd3XdKKaCxDubRNrmCtS1g==
X-Received: by 2002:a17:903:22d2:b0:240:a4b5:fe0d with SMTP id d9443c01a7336-245ffa5b6cbmr3398745ad.6.1755783540818;
        Thu, 21 Aug 2025 06:39:00 -0700 (PDT)
Received: from google.com (3.32.125.34.bc.googleusercontent.com. [34.125.32.3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fb85e7sm4806942a12.12.2025.08.21.06.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:38:59 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:38:54 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, Li Li <dualli@google.com>,
	Tiffany Yang <ynaffit@google.com>, John Stultz <jstultz@google.com>,
	Shai Barack <shayba@google.com>,
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
Message-ID: <aKchboXyR1oQDV_e@google.com>
References: <20250727182932.2499194-1-cmllamas@google.com>
 <20250727182932.2499194-4-cmllamas@google.com>
 <e21744a4-0155-40ec-b8c1-d81b14107c9f@leemhuis.info>
 <2025082145-crabmeat-ounce-e71f@gregkh>
 <ddbf8e90-3fbb-4747-8e45-c931a0f02935@leemhuis.info>
 <2025082120-phoney-husband-d028@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025082120-phoney-husband-d028@gregkh>

On Thu, Aug 21, 2025 at 03:25:59PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Aug 21, 2025 at 03:00:50PM +0200, Thorsten Leemhuis wrote:
> > On 21.08.25 14:19, Greg Kroah-Hartman wrote:
> > > On Thu, Aug 21, 2025 at 10:49:09AM +0200, Thorsten Leemhuis wrote:
> > >> On 27.07.25 20:29, Carlos Llamas wrote:
> > >>> From: Li Li <dualli@google.com>
> > >>>
> > >>> Introduce a generic netlink multicast event to report binder transaction
> > >>> failures to userspace. This allows subscribers to monitor these events
> > >>> and take appropriate actions, such as stopping a misbehaving application
> > >>> that is spamming a service with huge amount of transactions.
> > >>>
> > >>> The multicast event contains full details of the failed transactions,
> > >>> including the sender/target PIDs, payload size and specific error code.
> > >>> This interface is defined using a YAML spec, from which the UAPI and
> > >>> kernel headers and source are auto-generated.
> > >>
> > >> It seems to me like this patch (which showed up in -next today after
> > >> Greg merged it) caused a build error for me in my daily -next builds
> > >> for Fedora when building tools/net/ynl:
> > >>
> > >> """
> > >> make[1]: Entering directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/lib'
> > >> gcc -std=gnu11 -O2 -W -Wall -Wextra -Wno-unused-parameter -Wshadow   -c -MMD -c -o ynl.o ynl.c
> > >>         AR ynl.a
> > >> make[1]: Leaving directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/lib'
> > >> make[1]: Entering directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated'
> > >>         GEN binder-user.c
> > >> Traceback (most recent call last):
> > >>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 3673, in <module>
> > >>     main()
> > >>     ~~~~^^
> > >>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 3382, in main
> > >>     parsed = Family(args.spec, exclude_ops)
> > >>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated/../pyynl/ynl_gen_c.py", line 1205, in __init__
> > >>     super().__init__(file_name, exclude_ops=exclude_ops)
> > >>     ~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > >>   File "/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/pyynl/lib/nlspec.py", line 462, in __init__
> > >>     jsonschema.validate(self.yaml, schema)
> > >>     ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^
> > >>   File "/usr/lib/python3.13/site-packages/jsonschema/validators.py", line 1307, in validate
> > >>     raise error
> > >> jsonschema.exceptions.ValidationError: 'from_pid' does not match '^[0-9a-z-]+$'
> > >>
> > >> Failed validating 'pattern' in schema['properties']['attribute-sets']['items']['properties']['attributes']['items']['properties']['name']:
> > >>     {'pattern': '^[0-9a-z-]+$', 'type': 'string'}
> > >>
> > >> On instance['attribute-sets'][0]['attributes'][2]['name']:
> > >>     'from_pid'
> > >> make[1]: *** [Makefile:48: binder-user.c] Error 1
> > >> make[1]: Leaving directory '/home/kbuilder/ark-vanilla/linux-knurd42/tools/net/ynl/generated'
> > >> make: *** [Makefile:25: generated] Error 2
> > >> """
> > > 
> > > Odd, this works for me.
> > 
> > Hmmm, happened on various Fedora releases and archs in Fedora's coprs
> > buildsys for me today. And with a local Fedora 41 x86_64 install, too;
> > in the latter case (just verified) both when checking out next-20250821
> > and 63740349eba78f ("binder: introduce transaction reports via netlink")
> > from -next.
> > 
> > > How exactly are you building this?
> > 
> > Just "cd tools/net/ynl; make".
> 
> Odd, this works for me in the driver-core-next branch, but in linux-next
> it blows up like this.  Is it a merge issue somewhere?  I don't know
> what this tool is doing to attempt to debug it myself, sorry.
> 
> greg k-h

The commit enforcing the restriction on underscores is:
  af852f1f1c95 ("netlink: specs: enforce strict naming of properties")

I'm able to reproduce the issue locally now, and switching to dashes
fixes it. Sorry, I was not aware of this restriction but I'll send a
quick patch to fix this.

--
Carlos Llamas

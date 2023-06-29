Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEA713AC3
	for <regressions@lists.linux.dev>; Thu, 29 Jun 2023 17:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688060596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EuVtH4//9ixVPbYzIxcKCDvS3vv7wF8XPbIE+9o6mxc=;
	b=EtrkpOKZ0OiOPzGnkzhdBhHHVyCA1fFjhnjPAA60aU3eLH2TItTiAgX0Xi7K1KgYLmr5V5
	DGAbS3NlmvV7rHHa1GRGP+ixk3jHzG9W7pPXZDoJHQ36w1Aqunj5uWJwCcd3/WWdXBrx77
	pYjA4tnbx5wu7BKj+4y+cR72eoZZFLY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-B2WD5aj1ONWYAq9VRL-BPQ-1; Thu, 29 Jun 2023 13:43:14 -0400
X-MC-Unique: B2WD5aj1ONWYAq9VRL-BPQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-765986c0568so111817185a.1
        for <regressions@lists.linux.dev>; Thu, 29 Jun 2023 10:43:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688060594; x=1690652594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EuVtH4//9ixVPbYzIxcKCDvS3vv7wF8XPbIE+9o6mxc=;
        b=FT7c0naANfUD4PUCGM2yPBI+BPn+fX/Sd4+JdamQuT5B/RM9xbyNKhlBogXQcPSUa9
         rHOpcFr8vCq7DPk7WzfpTfe8AEkkFjy3UNLJIGu/IRVU8qYI6jf9zjgrTyWXTAWbO0a3
         GZDV4lK+BkoF1E/CRhnwyNY93rdCqWMxC9atB9hQK/XRB8ZkrKVrZcEYXDEsni1mhlOz
         JZQ/DCLX69OdIR7V6crVdVIOLt7UtQLqy8TY6Hexgt50KMPQJOdmQkbl4ICh+ppHzhec
         gYN7NoA2TxFmiLaDAYo/FSgl3V4365n/knLo5+kKIx1UfPkD/84+o/LQ8xZ+EPlcuUz9
         zCXQ==
X-Gm-Message-State: AC+VfDzb1rmE0/GKLI2S1bjfU78zefuiVWvuKDBxc/e4wwEntHkdal8L
	rM7XBSBNQq9z9N+wL0Lee7jI2kcrefKdPmJ6kIizC0YCqk6FCs5JukDY0E+nzfbm8qjlW9po30T
	qxhBh1LA5+vAaWkm+2CHh4As=
X-Received: by 2002:a05:620a:2983:b0:765:4e03:b136 with SMTP id r3-20020a05620a298300b007654e03b136mr12908473qkp.53.1688060594466;
        Thu, 29 Jun 2023 10:43:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6wUvoKtw61bEx8CLR5eCKB4AQLfhTW4aNAJ+TKGlBZC1NadeujK87p+MvIOiYmY7JuI+2Ytg==
X-Received: by 2002:a05:620a:2983:b0:765:4e03:b136 with SMTP id r3-20020a05620a298300b007654e03b136mr12908457qkp.53.1688060594241;
        Thu, 29 Jun 2023 10:43:14 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id h14-20020a05620a10ae00b007670ee46528sm3106075qkk.116.2023.06.29.10.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 10:43:13 -0700 (PDT)
Date: Thu, 29 Jun 2023 10:43:12 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Sachin Sant <sachinp@linux.ibm.com>, 
	open list <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"jarkko@kernel.org" <jarkko@kernel.org>, 
	"linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>
Subject: Re: [6.4-rc6] Crash during a kexec operation
 (tpm_amd_is_rng_defective)
Message-ID: <baqjq4zvfwte2y5rpsznu26qzapjjzhycydwgir34yvttbzvzq@z3pfby7pdjo7>
References: <99B81401-DB46-49B9-B321-CF832B50CAC3@linux.ibm.com>
 <87o7lhfmoh.fsf@mail.lhotse>
 <CA0088E4-2851-4AFF-94F8-2A07C5CDA8D8@linux.ibm.com>
 <675a8893-429d-05be-b647-089b249c814c@leemhuis.info>
 <87o7l7oer1.fsf@mail.lhotse>
 <3f5a37f1-70e0-3dcf-3bd3-acc8a04e53ee@amd.com>
 <c53ihvuesmymj2o5jyqz7gw7mvbrxjifmphuuhiux3qjabjnic@wcak4hfb77td>
 <MN0PR12MB6101C50288F6FE99A3DA5D4FE225A@MN0PR12MB6101.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <MN0PR12MB6101C50288F6FE99A3DA5D4FE225A@MN0PR12MB6101.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 29, 2023 at 05:28:58PM +0000, Limonciello, Mario wrote:
> [Public]
> 
> > -----Original Message-----
> > From: Jerry Snitselaar <jsnitsel@redhat.com>
> > Sent: Thursday, June 29, 2023 12:07 PM
> > To: Limonciello, Mario <Mario.Limonciello@amd.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>; Linux regressions mailing list
> > <regressions@lists.linux.dev>; Sachin Sant <sachinp@linux.ibm.com>; open
> > list <linux-kernel@vger.kernel.org>; linuxppc-dev <linuxppc-
> > dev@lists.ozlabs.org>; jarkko@kernel.org; linux-integrity@vger.kernel.org
> > Subject: Re: [6.4-rc6] Crash during a kexec operation
> > (tpm_amd_is_rng_defective)
> >
> > On Thu, Jun 22, 2023 at 09:38:04AM -0500, Limonciello, Mario wrote:
> > >
> > > On 6/22/2023 7:36 AM, Michael Ellerman wrote:
> > > > "Linux regression tracking (Thorsten Leemhuis)"
> > <regressions@leemhuis.info> writes:
> > > > > Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> > > > > for once, to make this easily accessible to everyone.
> > > > >
> > > > > As Linus will likely release 6.4 on this or the following Sunday a quick
> > > > > question: is there any hope this regression might be fixed any time
> > > > > soon?
> > > > No.
> > > >
> > > > I have added the author of the commit to Cc, maybe they can help?
> > > >
> > > > The immediate question is, is it expected for chip->ops to be NULL in
> > > > this path? Obviously on actual AMD systems that isn't the case,
> > > > otherwise the code would crash there. But is the fact that chip->ops is
> > > > NULL a bug in the ibmvtpm driver, or a possibility that has been
> > > > overlooked by the checking code.
> > > >
> > > > cheers
> > >
> > > All that code assumes that the TPM is still functional which
> > > seems not to be the case for your TPM.
> > >
> > > This should fix it:
> > >
> > > diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
> > > index 5be91591cb3b..7082b031741e 100644
> > > --- a/drivers/char/tpm/tpm-chip.c
> > > +++ b/drivers/char/tpm/tpm-chip.c
> > > @@ -525,6 +525,9 @@ static bool tpm_amd_is_rng_defective(struct
> > tpm_chip
> > > *chip)
> > >         u64 version;
> > >         int ret;
> > >
> > > +       if (!chip->ops)
> > > +               return false;
> > > +
> > >         if (!(chip->flags & TPM_CHIP_FLAG_TPM2))
> > >                 return false;
> >
> >
> > Should tpm_amd_is_rng_defective compile to nothing on non-x86
> > architectures? This code is all about
> > working around an issue with the AMD fTPM, right?
> >
> 
> That's a good point.  Yes it could and that would also solve this problem.
> 
Or I guess more accurately for non-x86 it should be:

static bool tpm_amd_is_rng_defective(struct tpm_chip *chip)
{
	return false;
}


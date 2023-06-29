Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6572513AC3
	for <regressions@lists.linux.dev>; Thu, 29 Jun 2023 17:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1688058414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A/N1q1JcWIXlbNgkIYZVnaEQ46bfA3UQYlq1BYT9Ptg=;
	b=K8BgH5vpJzbTf8wonsRqP7QPdTl+CAgMoqWBVQLX3tDxWoYW0z7x6YLw8EpBRraWmcqBGy
	SqzHPVqMg/YF4RatGEZdmWnVLflg3ROadFJfwOcdc/21B0btF3TWPHQgfU//vmp5ZAdhr5
	MP0kP4kTHfEP6RrhaFrJyewIMO4Bt04=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-RGkpAh8-MJSnElQloXHJeA-1; Thu, 29 Jun 2023 13:06:50 -0400
X-MC-Unique: RGkpAh8-MJSnElQloXHJeA-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-635f63d0c1aso8241416d6.3
        for <regressions@lists.linux.dev>; Thu, 29 Jun 2023 10:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688058410; x=1690650410;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A/N1q1JcWIXlbNgkIYZVnaEQ46bfA3UQYlq1BYT9Ptg=;
        b=l7fFu/aXsBPhsPsQjXuyLAib97BqcXJoEqwk5Hy8EUrArQEtR5UfZXD/mVVQ1FSQcq
         bhMPYu8vmSg29nU3EwmuFR0NaAcXEdwxUAynb4lXI6dvnFB/B9a/6jVKkjGSx5C6wal5
         flY9IHp/eSwl/xJyGiq1o14eU82u1YBLZvJNceGHK+aY0lHXCN2DXmQ1qv79yIwpUX5h
         5s9mxZ/8u88nULJkDO/RTGBEKLUzQ7Xf8nz7DhFkbw273HAiCp9o7SZ/KoDQIuJjnXd7
         hFmaie4ZL+UkV1fy9F8iUpK5DJpOzguLR33Zmd0r37dJDR8b1lf431RM2SjJOj4mbO3H
         FWuw==
X-Gm-Message-State: ABy/qLZYbM6CcJcI8/FDuojuRcVOVhYGfWZQJFPOVgDNok0JpispLqeO
	UeUOG49i3bnJZ3r+pLHBfE/Ndg0T1G1f3AmhBoPY6q9or82//XYF3TFQDToXO7DQ6rk4D98rhBL
	wKJmo0d7+C/XwjXVH2Ne8oYg=
X-Received: by 2002:a05:6214:c62:b0:635:f412:6a70 with SMTP id t2-20020a0562140c6200b00635f4126a70mr201038qvj.47.1688058410034;
        Thu, 29 Jun 2023 10:06:50 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFZM+GVL4jbhfP9zasY2tqCDNztP4bkyURAOopcPQX4hdKl1OEm2B1JeATQ8vjOF5cd1WWHxw==
X-Received: by 2002:a05:6214:c62:b0:635:f412:6a70 with SMTP id t2-20020a0562140c6200b00635f4126a70mr201016qvj.47.1688058409582;
        Thu, 29 Jun 2023 10:06:49 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id z15-20020a0ce98f000000b006300ff90e71sm7197174qvn.122.2023.06.29.10.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 10:06:49 -0700 (PDT)
Date: Thu, 29 Jun 2023 10:06:47 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: "Limonciello, Mario" <mario.limonciello@amd.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Sachin Sant <sachinp@linux.ibm.com>, 
	open list <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, jarkko@kernel.org, 
	linux-integrity@vger.kernel.org
Subject: Re: [6.4-rc6] Crash during a kexec operation
 (tpm_amd_is_rng_defective)
Message-ID: <c53ihvuesmymj2o5jyqz7gw7mvbrxjifmphuuhiux3qjabjnic@wcak4hfb77td>
References: <99B81401-DB46-49B9-B321-CF832B50CAC3@linux.ibm.com>
 <87o7lhfmoh.fsf@mail.lhotse>
 <CA0088E4-2851-4AFF-94F8-2A07C5CDA8D8@linux.ibm.com>
 <675a8893-429d-05be-b647-089b249c814c@leemhuis.info>
 <87o7l7oer1.fsf@mail.lhotse>
 <3f5a37f1-70e0-3dcf-3bd3-acc8a04e53ee@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <3f5a37f1-70e0-3dcf-3bd3-acc8a04e53ee@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jun 22, 2023 at 09:38:04AM -0500, Limonciello, Mario wrote:
> 
> On 6/22/2023 7:36 AM, Michael Ellerman wrote:
> > "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info> writes:
> > > Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> > > for once, to make this easily accessible to everyone.
> > > 
> > > As Linus will likely release 6.4 on this or the following Sunday a quick
> > > question: is there any hope this regression might be fixed any time
> > > soon?
> > No.
> > 
> > I have added the author of the commit to Cc, maybe they can help?
> > 
> > The immediate question is, is it expected for chip->ops to be NULL in
> > this path? Obviously on actual AMD systems that isn't the case,
> > otherwise the code would crash there. But is the fact that chip->ops is
> > NULL a bug in the ibmvtpm driver, or a possibility that has been
> > overlooked by the checking code.
> > 
> > cheers
> 
> All that code assumes that the TPM is still functional which
> seems not to be the case for your TPM.
> 
> This should fix it:
> 
> diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
> index 5be91591cb3b..7082b031741e 100644
> --- a/drivers/char/tpm/tpm-chip.c
> +++ b/drivers/char/tpm/tpm-chip.c
> @@ -525,6 +525,9 @@ static bool tpm_amd_is_rng_defective(struct tpm_chip
> *chip)
>         u64 version;
>         int ret;
> 
> +       if (!chip->ops)
> +               return false;
> +
>         if (!(chip->flags & TPM_CHIP_FLAG_TPM2))
>                 return false;


Should tpm_amd_is_rng_defective compile to nothing on non-x86 architectures? This code is all about
working around an issue with the AMD fTPM, right?

Regards,
Jerry


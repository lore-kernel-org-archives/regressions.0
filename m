Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD3323A4
	for <regressions@lists.linux.dev>; Fri, 26 May 2023 08:34:47 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-25632c99eecso160846a91.2
        for <regressions@lists.linux.dev>; Fri, 26 May 2023 01:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685090087; x=1687682087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o1AB18/+VPofNdgVVfpkQbQ+ysDkEYSuV7ztvKqEjdA=;
        b=B3WcL/au1RZpNmcuqrpLzIqE3imXF7YKBx4vb1bIjkiA+v4dsJ0t/DBRGpf3v+EFvR
         uxl0TUfQ1QwkF138U6R7QPV+/bIBSBZqSJoP2oz7eDG2K8/zIU5ASeW6RfIjIZpT1lt/
         QKoFxTlFuVFYj3cBP4Pk1WkN5pwH8KciEzT25Qwt4DRA3THQFb6dmLkvc7YVglc2qfK0
         hqUWiwooSOSrfvGNj35yXwYQU+BzXoNMsvyPYsuF1wmSNZmMkOdmL+UTi+yF6O41TSQl
         Ye0rlCEGdO+P7esifRlrLQisWwoZ0v+gnFCe5y5XL9suZtKW6mcaknHbDNCMFe+qBBP8
         4P1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685090087; x=1687682087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1AB18/+VPofNdgVVfpkQbQ+ysDkEYSuV7ztvKqEjdA=;
        b=RIR0qUvCsDN1DTVV8WOXe9AzKUx66VwZ3WxglW8zwnkVnWYD2kQocYuPOWQyDxV9jU
         W/AysQ8+EAhSrPawYA5HWa5fHbP9IAMCzVs9ASbY0fz4qQx4rihsEs3encwpO5UTPl4u
         Q1ESA/ScOlfAqjuUDoijTX4NY1UOGgZSmjqfFGaloXmx+032jz+fu94YopWQyZCvcVPy
         F51Uyi8ib7JLCHt16ambkTthpzB0RdtsCssM1qfKpz85hj1ZIDsQ8ruu0Pj7HQunLhr6
         8FDfeGm0dlN26D+o5veTBtcV3/hejPuiDMXov3Malicmgga2nZKLnGi7kzrPaGufoDLu
         0ZPg==
X-Gm-Message-State: AC+VfDxNTADxhC/8GkfhcxJ6jTmaXq2JbdGKdD/+A+N6hegGK8T6Q2lN
	0+6VFPKnakYr/AXMzwvybLg=
X-Google-Smtp-Source: ACHHUZ6aqfXlmWrBKADGELzaGcFpJTazMOjtftfE1A8IxNlikRUWTcmBhY6iXiTHJKiQGh6Rp6mXEg==
X-Received: by 2002:a17:90a:6fa1:b0:256:2b9e:e0b with SMTP id e30-20020a17090a6fa100b002562b9e0e0bmr1290023pjk.27.1685090087364;
        Fri, 26 May 2023 01:34:47 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-28.three.co.id. [180.214.232.28])
        by smtp.gmail.com with ESMTPSA id i17-20020a17090332d100b001ab0d815dbbsm2715151plr.23.2023.05.26.01.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 01:34:46 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 3523C106212; Fri, 26 May 2023 15:34:42 +0700 (WIB)
Date: Fri, 26 May 2023 15:34:42 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Fabio Coatti <fabio.coatti@gmail.com>, stable@vger.kernel.org,
	regressions@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: WARNING trace at kvm_nx_huge_page_recovery_worker on 6.3.4
Message-ID: <ZHBvIpQoH_zjMSSW@debian.me>
References: <CADpTngX9LESCdHVu_2mQkNGena_Ng2CphWNwsRGSMxzDsTjU2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADpTngX9LESCdHVu_2mQkNGena_Ng2CphWNwsRGSMxzDsTjU2A@mail.gmail.com>

On Fri, May 26, 2023 at 09:43:17AM +0200, Fabio Coatti wrote:
> Hi all,
> I'm using vanilla kernels on a gentoo-based laptop and since 6.3.2 I'm
> getting the kernel log  below when using kvm VM on my box.
> I know, kernel is tainted but avoiding to load nvidia driver could
> make things complicated on my side; if needed for debug I can try to
> avoid it.

Can you try uninstalling nvidia driver (should make kernel not tainted
anymore) and reproduce this regression?

-- 
An old man doll... just what I always wanted! - Clara

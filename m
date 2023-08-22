Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE56A2B544
	for <regressions@lists.linux.dev>; Tue, 22 Aug 2023 16:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692722663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=drSKQmIr7hHEh3n3jADc2gpNo2nyOeHA8jWVVkOgk/o=;
	b=Hss+rFhpoBP2kldt802xXHam1OMPmL6DxHqZS+M0YQVGm4TsZwcygBkoboGBqcPxURkYS5
	IzCM/bkcOwyn+8vRkGXVlpX0xAeAomr9/5Iq6+OZxJS71mRCurrAUEeS/LsW/HKW0Eiebj
	W80tokf7J37cRseX9oMkZWt2MQZPN/M=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-MFb722w4PqqOiUZgUi19yQ-1; Tue, 22 Aug 2023 12:44:21 -0400
X-MC-Unique: MFb722w4PqqOiUZgUi19yQ-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-26d5094188cso4620059a91.0
        for <regressions@lists.linux.dev>; Tue, 22 Aug 2023 09:44:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692722661; x=1693327461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drSKQmIr7hHEh3n3jADc2gpNo2nyOeHA8jWVVkOgk/o=;
        b=bxc8scBlzi5fYMLi5q80WIBIVBvCEL1Br7Khpcv2yDmO1T//bAo6yft2FTbZ2tyLEs
         MwWtH8eh2JAT4BX3pugPZRDTIdaiE/CccMHb3gBGWmvFYC/a6jd1T62RcM7R5+9ZjS2k
         DxP9mK+eEjxqPYc4oVf3e3kDQEDewqFBBSUdtLIeeIfqQt8AUJEgKIzD8bBjmR4UYXxL
         G103hi3EzfbA8XpXMqzI3nIW4ykib8kWgTer0BM0jqNdyVDPiyNOZZfoeTypfz8pjcwb
         +NrWowdnfAIK9DZXyroHHiYVYm/qboFHLWRJbeBh3LPTLbjniiEa4LLuJsDcSSmakexw
         G7fA==
X-Gm-Message-State: AOJu0YzFSgKZLrYb/PvoF9nyodMVU5bqldv14idgXIzI8AmsoFzLOvBq
	jj3e7gU7SDr/GSQ8lPAWr0kHhMCMAfpuOmEGuL730Q8n4e6QIZpX3JsTCmPTCwAyOBOg7LwhsHX
	20deL4NaD27wBGm7/81T6Lcunjwp/hl2uQKToGg==
X-Received: by 2002:a17:90a:b017:b0:268:ee6:6bdf with SMTP id x23-20020a17090ab01700b002680ee66bdfmr7276863pjq.47.1692722660854;
        Tue, 22 Aug 2023 09:44:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF87zFT+7w/2xuyn819nEqi0XKnQ9k5kT7k+IdPntcNXLV6sv7bznE1y2rk8e5Xm+mArgWezgi7gwWrImFugh4=
X-Received: by 2002:a17:90a:b017:b0:268:ee6:6bdf with SMTP id
 x23-20020a17090ab01700b002680ee66bdfmr7276851pjq.47.1692722660596; Tue, 22
 Aug 2023 09:44:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+cBOTeWrsTyANjLZQ=bGoBQ_yOkkV1juyRvJq-C8GOrbW6t9Q@mail.gmail.com>
 <20230821131223.GJ3465@black.fi.intel.com>
In-Reply-To: <20230821131223.GJ3465@black.fi.intel.com>
From: Kamil Paral <kparal@redhat.com>
Date: Tue, 22 Aug 2023 18:43:54 +0200
Message-ID: <CA+cBOTc-7U_sumg6g-uBs9w3m8xipuOV1VY=4nmBcyuppgi8_g@mail.gmail.com>
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-pci@vger.kernel.org, regressions@lists.linux.dev, 
	bhelgaas@google.com, chris.chiu@canonical.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 21, 2023 at 3:13=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> Thanks for the detailed description! There was follow up patch that made
> the timeout shorter for slow links, I wonder if you could try that first
> and see if that changes anything? It is this commit in the mainline:
>
> 7b3ba09febf4 PCI/PM: Shorten pci_bridge_wait_for_secondary_bus() wait tim=
e for slow links
>

Hello Mika, thanks for a quick response. Please see my reply to Bjorn,
the resume is just 60+ seconds delayed, not completely failing, I was
wrong about that. I attached my logs there.

To respond to your question, I applied 7b3ba09febf4 on top of
fe15c26ee26e (which is the parent of e8b908146d44) and tested that.
Hopefully I understood the instructions correctly. That kernel resumes
just fine, with the expected speed (~5 seconds), no extra delay. (If
there's a speed-up, I can't really tell).

Thank you for looking into this.
Kamil P=C3=A1ral


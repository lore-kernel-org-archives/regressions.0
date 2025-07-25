Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BA72BEFEA
	for <regressions@lists.linux.dev>; Fri, 25 Jul 2025 08:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753432708; cv=none; b=oYzJm2fJokXdiRQ2Rc6PEDc4NLZyELMwPFC0us2eqE4icB1lTb7HmbsTOWvYDOOL+MB3bjyMYPZhq8C0q+73FV7Rckj4pr4GacpviEbQ/QJtY5rfXtRUUitA+7QoRNorAquc4oA/ISIBHQwPAeRLmmdSfH+Ar8XEWBhNi64KGq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753432708; c=relaxed/simple;
	bh=TXwNMHahCwTnrJfL9xKeS40A5b6CJKKrcTK+pyajkkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ih7bvoL3SzRAaKBN2KORP5g9GD+jzBs2oBn7XHx8AUQmkmapu9rd/owrr9Xcz/aLlUmrgMCphRY9WwcmGhMzAFbfyH6LUt8HPRGb/+LaJBmNGRoKuzTubNZVaPjDKesNYTiZZDX+tQONAM/4zvLcEptSntjzEbu1tEzrGBYc4aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KQ+5xKtP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KQ+5xKtP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753432705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TXwNMHahCwTnrJfL9xKeS40A5b6CJKKrcTK+pyajkkA=;
	b=KQ+5xKtPHdEiqUOYpuIOj4mtT2+1MC7I2uqDseaN2EFTzrFf2XlIC2137LfKi4z8ujZLsF
	XgvO97Dml1rqX0wS3Y/Cw2/4byWioaoUkGp96cvxHazhIdhO6pe4skoLqhgs/P/MQMYcfA
	JOufG4wpKrjDT+NblIu5dECwxkGrMTw=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-k9umbOlJMYSm58OMbkokbQ-1; Fri, 25 Jul 2025 04:38:19 -0400
X-MC-Unique: k9umbOlJMYSm58OMbkokbQ-1
X-Mimecast-MFC-AGG-ID: k9umbOlJMYSm58OMbkokbQ_1753432698
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23507382e64so19980225ad.2
        for <regressions@lists.linux.dev>; Fri, 25 Jul 2025 01:38:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753432698; x=1754037498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXwNMHahCwTnrJfL9xKeS40A5b6CJKKrcTK+pyajkkA=;
        b=QfAGEpFBYVJZsJ4M9vNrv2qV5NSPP3Xd9p8d/M2JacRekeSowk9eqXgKWr2tb7aqNz
         V1VuS/083KrGVTQGTdUOGFGBel0h+UOfLO9/hO7ERmbicwUs5NnuY1L3DQ4JwPOJGMuF
         TlN2WsM6+z3Vo1n9jy0EBQElZqRueUHXSMk4qXjT50OCJa9rCzJ0tAglhxo5eRSw1OIJ
         NgvbzvuB7vOn64jktdjlv8h272TRkD4JGUNkESDSbURPI0tIBKByw9eTMEuToHfLA5iY
         pm60AZNOAnvuzebbjXHTK3c0mPL31qLVEqGNsV++muK4TF6pOaFVhVNKUiU4Ys2P91BA
         ow3g==
X-Forwarded-Encrypted: i=1; AJvYcCUjsyF2P9jqTcP7N43xY8ytWOWgmcAffg4bIoVCdeatBEnxCLGbVopRJDoDBDV5P3OkX8Rxbyv4kq1UQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQwtVJs76+rERu+KaSI19LeA2Kq8QlzyUyFIIiyMPsEYuo9BmG
	LuWL7sx1ONSEcXZRWYRyZMcoeKmz9Jpv8m+b4ttsKlox48UmJSc+T8mFeRPAJX94EWArT10fnKE
	KM4ZKT2OWKVRzXXmrHc6FafyGiSZmgn8Q7B+MNJVy40qMTAQlMFzR5TZdyiTf1XK8IMzs/At0FV
	KQUsuWbwbfNeNf7fwz9toWJrasfsa/1fUGG08xfeYjumZ5yRIOcg==
X-Gm-Gg: ASbGncuVG3yX3/9YKp8mFY6wyOaG+MUIForoR/oU5+Q/hK5sJLx4O8TQSDVRLW3M9Gx
	grkThjf2dejgp2hiakQ5otmgHbx+hR33GAaT6oPOh0sCFf+XRTr5mGn3joTd7tks3hsdQxhbepP
	31KFZ04u7ieVvIsNyomGAR
X-Received: by 2002:a17:902:ea02:b0:234:9375:e081 with SMTP id d9443c01a7336-23fb319041emr15224855ad.42.1753432697781;
        Fri, 25 Jul 2025 01:38:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHxiXGFsVJ6VCDQe69iuWZ8IkeaAljBvCSgmtMhHsWEWWFbjBiBJy5Wl237ze4kjSg2FPfsWB5YeRg80cn+io=
X-Received: by 2002:a17:902:ea02:b0:234:9375:e081 with SMTP id
 d9443c01a7336-23fb319041emr15224615ad.42.1753432697398; Fri, 25 Jul 2025
 01:38:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <175341594422.117.11494999566960779174@508e4dbc6f9f> <d2e84599-bf73-44bb-a0f4-a5fe4086978e@infradead.org>
In-Reply-To: <d2e84599-bf73-44bb-a0f4-a5fe4086978e@infradead.org>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 25 Jul 2025 16:38:06 +0800
X-Gm-Features: Ac12FXwJd96XrGIsW0Jv49edVkL7BCbWfeMwc-34kp0AVdNMEzvYogs4x3NChbM
Message-ID: <CACGkMEuFbNMiFUY-aYHgZTvLcypFJWatgAuGB_M25f7QyzqTEw@mail.gmail.com>
Subject: Re: [REGRESSION] next/master: (build) variable 'id' is uninitialized
 when used here [-Werror,-Wuninitial...
To: Randy Dunlap <rdunlap@infradead.org>
Cc: kernelci@lists.linux.dev, kernelci-results@groups.io, 
	regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g_k9oLMmGYRqLj5jgPzKDuS1d3IYxBKHwCjTQpbYnpw_1753432698
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2025 at 1:03=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> due to commit 60c060930f481:
>
> +cc Jason Wang

I've posted a fix:

https://lore.kernel.org/virtualization/20250725083635.73355-1-jasowang@redh=
at.com/T/#u

Thanks


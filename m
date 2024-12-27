Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BA028EA
	for <regressions@lists.linux.dev>; Fri, 27 Dec 2024 05:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735276844; cv=none; b=Q8QCm4f7VH2HGIPKl6Xd7Kw+SPUiviL80RtaqRNV0gk1oJ2GtYzqwMlR0GfWlFZcdOJDYzCTo3ATAduTn+kIAKhOMIwYhzbabePGqlUTQZUgBhSX2N/f3aaRZe/zdvbHzYz3emgetYxg5ufyf/N0NHe1wVeXdZtOuqjO4LMhLcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735276844; c=relaxed/simple;
	bh=mKYWYmNE8aDXKrgYHHmBVtjSZ/2KmkthuR8OjJbdxwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCiSGDO9/KVQdqLh6rUVqlzWUqT7qJLL2OD8nEfLG719GU1K15d2ya9JE74aEnD0+y7BDG5Ge9gQMxuLAbpCN9riL+whoptj5xmIuwk/FJzbGEkIm3RQQBGLnQzVIhz2t9xywHBmvawwqZnjgpAQ7yPBSUWKP+8R83/1DL/cAek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A+zStNhk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A+zStNhk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1735276841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u3uwVB+wj/KGv+xCAViP2xyRHKNiM4vK8po0NHZSouU=;
	b=A+zStNhkRAMdIJDvrEvglmpjjB7BwxO/mPB4qdiubttytd1MHPcNkZq+Wus8+HPZuy5fqm
	NlMH2PzjdPT9diFbF3daowUN6JUPFw5qny1FWdm/VyDa7AhHi93/CDOGU5ehYfW7ptqsu0
	7P3DLV6ICtUxZN1IbzGNi08FLddqhTM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-equHmLhiOfmaHlVQIxRzGQ-1; Fri, 27 Dec 2024 00:20:39 -0500
X-MC-Unique: equHmLhiOfmaHlVQIxRzGQ-1
X-Mimecast-MFC-AGG-ID: equHmLhiOfmaHlVQIxRzGQ
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4362552ce62so37525515e9.0
        for <regressions@lists.linux.dev>; Thu, 26 Dec 2024 21:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735276839; x=1735881639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3uwVB+wj/KGv+xCAViP2xyRHKNiM4vK8po0NHZSouU=;
        b=NwyqbTyKrSWAl0ABWmHo/TqWdys45GKDCiP8CsrrazBTDTflhArb5L132ydK/WvaRw
         RODhbYM0n9RJzAjlNntfK2CX0WZN99JH+oCkVno3hwxMjZO63NAO7VvWwYl8kb6ZnIsV
         vWXiRiWkgTIPPNXI790cO6FcNRfsxLkZYvAC5nuG3gdTxVEj1zTC96J9S1WZ0UqRjrgO
         p0DRLzSeK4gDF03NaChGExTfwmK+0Lq8lI95Z6+tqvk3lFnCKOCgd6mF+90NrOxGKxcQ
         YJ3zfadHaL8fdgAqSvzrxrxMtSWh0rrwuah0q5nejp34ScUmGI77Fu3Mkb3SR1B/p4BK
         gHKw==
X-Forwarded-Encrypted: i=1; AJvYcCU3L86z7iTvuSQdJlGkPCI+i+hqmrC8d+Fi25Ibvt8S50IWP/OYj7d+6k3QthL+Y40Z9V3RmJVm8iI3VA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKGNnzX4yAI3pV2PWFnBG+cNVRlf/gPXfOJIWOhV4/Gq8mD2J4
	f5neO/DOuRksZINGHJtd1XWOTjeAS8GpVSHJfWeMOOMVNdRTY0olfCx5t77EVipMQLU17hnK6JU
	0x+NN7D46MEFqxZ4utpdrYwBw4dn+75lX231Y/t/5Br83Lvms2fOetSeACWaRwLhEkkZKbuwAC/
	2hrqpQwXmnvSVAevYAArBhfrhWhmZKxgg9CoM=
X-Gm-Gg: ASbGncv1vhl/+kR8AMioWdjzHo8btcCYI6F9aO3/yChH0x3oIn3KSmTvxeH7q3TSRpi
	FZOrvqEUjbozo0u+uv23RqJ9mU3+ZoULNABQtKA==
X-Received: by 2002:a05:600c:524c:b0:434:f3a1:b214 with SMTP id 5b1f17b1804b1-43668b7a1eamr168614345e9.28.1735276838798;
        Thu, 26 Dec 2024 21:20:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrwTZZFAZNlT8g9rXFUCimpsFWn0ojtZb0lkx+DS7F2ZrEhv2PZda7B6dlKlBOjXLkWGoPJkAjlaQskHk7E/A=
X-Received: by 2002:a05:600c:524c:b0:434:f3a1:b214 with SMTP id
 5b1f17b1804b1-43668b7a1eamr168614195e9.28.1735276838498; Thu, 26 Dec 2024
 21:20:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <6CC404E2-2442-47FE-877C-252B1F2872C2@xenosoft.de> <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
 <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de> <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
 <e6672ce2-2bf9-4a1e-b4b8-e1396ccbb56a@xenosoft.de> <1539b4dd-9a52-4f87-882d-cb605018d1f4@xenosoft.de>
 <0769459a-10ee-4573-a3ce-541c01429948@redhat.com> <fdd0528d-96f2-bc8d-783c-30600b0c15d8@xenosoft.de>
 <CABgObfa6ei-=dSRaPgj7OP07Y4nKAbTt3cRgMSCGRHUmkguOdQ@mail.gmail.com>
 <7d8b5b78-b20c-d915-4a94-7082d7e01600@xenosoft.de> <f944fadf-2dfe-4dd3-a086-ae7bb6c0bff6@redhat.com>
 <31895b11-5084-95bc-0f14-faaea023b7f8@xenosoft.de> <2881940a-2da0-4498-b447-f09fffb14189@redhat.com>
 <50149f09-174f-ad6e-e97d-3d8889b412a6@xenosoft.de> <CABgObfYqGVQk0nvPZqzc1Q7K0jg-Gxk2tVmrk75R6TaLUt9exQ@mail.gmail.com>
 <10826e5f-d3a6-7792-4466-0bf21082a155@xenosoft.de>
In-Reply-To: <10826e5f-d3a6-7792-4466-0bf21082a155@xenosoft.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 27 Dec 2024 06:20:26 +0100
Message-ID: <CABgObfY-R+ASCGbhDNaQPBLRk4jHiOOvOrN9+e-ub3=-VzKEYw@mail.gmail.com>
Subject: Re: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Darren Stevens <darren@stevens-zone.net>, 
	Pat Wall <pjwall@mac.com>, Pat Wall <pjwall@me.com>, Christian Zigotzky <info@xenosoft.de>, 
	madskateman@gmail.com, "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au, 
	regressions@lists.linux.dev
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RN_r_kTMmG-bWFxVY7_FSnGyF6cKDaLlM6Oo54Yu9iM_1735276839
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 3:26=E2=80=AFPM Christian Zigotzky
<chzigotzky@xenosoft.de> wrote:
> This has solved the issue:
>
> cp linux-6.12.6/arch/powerpc/kvm/e500_mmu_host.c
> a/arch/powerpc/kvm/e500_mmu_host.c
> cp linux-6.12.6/include/linux/kvm_host.h a/include/linux/kvm_host.h
> cp linux-6.12.6/virt/kvm/kvm_main.c a/virt/kvm/kvm_main.c
> cp linux-6.12.6/virt/kvm/kvm_mm.h a/virt/kvm/kvm_mm.h

Yes, those are exactly the file touched in the bisection result and in
my patch. However, reverting blindly like this would break the build
for all other architectures, and reintroduce the bugs which were fixed
by the change.

The patch in https://github.com/user-attachments/files/18238781/kvm_main.pa=
tch
is incorrect (the "*writable =3D false" line was not removed, thus
leaving in the NULL pointer dereference).  Please test the
kvm-e500-bisection-rebase branch of
https://git.kernel.org/pub/scm/virt/kvm/kvm.git, which has the patch
applied already:

- first test commit 0096d3855a5e80b9d4e43e5a291e8c79aa4abbc2, and
report if it fails

- then the entire branch, bisecting between
0096d3855a5e80b9d4e43e5a291e8c79aa4abbc2 and the top if it fails.

Paolo


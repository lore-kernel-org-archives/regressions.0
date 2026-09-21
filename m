Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DE04ABBB2
	for <regressions@lists.linux.dev>; Mon, 21 Sep 2026 14:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999877; cv=none; b=ne2+uBzAdGve8JoH7OeJJlFb8ycEQn9FsrMrJCP/2MGmfqmKDFTklcYZOclg4H+o/XAgKXYRtc5PY3fq65dtFm5LVqi9nYQgjCM23Ho7ab3uh4wJXfmu9DaLKSiJd8QfjakhVYo3hqweicfQVdThIEzFXNH3Ija2DrM96GL4bc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999877; c=relaxed/simple;
	bh=B4QJF82dna8D9ggBsF8oeK2V+6NAw7hoRbDRKemE+iA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sEesdybx2hqPDkt98sm64RgSRbDJPGNSngWsuI5F6es3fdjO/VjSvUOE3FK/mwzQUcjMzsIv+YEbUKEwKd+rHoiqpsbOVXcU13zowBf07juQhziRBcSmLwagqyvZWQwkhf/eo5jFJIEmVYJH86Wc6pQbxl5LTcNYa4XGpKPFDDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TLHmiBM0; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TLHmiBM0"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dd53f2b27cso38397155ad.0
        for <regressions@lists.linux.dev>; Mon, 21 Sep 2026 07:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789999875; x=1790604675; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KuS+RsQ1XJKIcaJnDQOiwRD0nOJzYFvdBOhw7tWIQmU=;
        b=TLHmiBM00DnoRv3iJEJ2H36DAtqPDq3MdiePcK1r2asGQ9HDygw7tzWWojw3sheVQe
         X7+srNZdFOir3H+urG75Uo2WQeXlOChVdpKhR1023Nj5UTXco5t1rLIKg8aD9wxJTAbm
         xWTmm80/3clXLrmpSIM08eCFnhjRXNbMyAT9E3+2QEq6KgJMft4fEeJ62m/5cWA2p33t
         Nx5LBH8M2DZEijq+8oz/vdZE79ulgXIQ4/yOhUnriE+kIZgOjEam+wLplzfr31TsLdpE
         wP9Yg0pjk5u9RINsMQXTO2QgJv/x4x5m2sXLFKcCPV+Z7Dkq4XmnCEqwWZE47ltvkxnO
         +0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789999875; x=1790604675;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuS+RsQ1XJKIcaJnDQOiwRD0nOJzYFvdBOhw7tWIQmU=;
        b=kVQcVJGHE8AYUDkGw4JiDDCtCBOfBzWxAGsljSiO0r61UOO/SLbX6ydSTdPEBGU5Pp
         n/pJC3MYuoLBZmrUzqPGmcnG/RZy8MGMTu3i9NPQ3OWuMff0z710vj6TxHNttQaPvxuF
         wrvTJUIVnPBeMQ6L6QQs1vxhDdndSl5xluGaFpPorZmftEl9i3DR/4HdVIMU7EsQiDSM
         A2cSSJtjWoW3OZ0F90x9/jF+2nIxTQx9fBqrqm7KJ22Ig+7xvsUnqNx0Ua8sMW/IKeTp
         E6y8XkiRcJHW0fwC9zNX+8SGBGzdB4GHaOQJOdcmOYa1cmCnmmflt7pV4S2RBSlIlzha
         +cNw==
X-Forwarded-Encrypted: i=1; AKwUvBzc+ASslayq9b31B3rMXFv4AP/JGFXkntTrkls/xC4PNFsKjA1T8zlazI7Ksa2bQLrbWRn8D/YtkHnQ8g==@lists.linux.dev
X-Gm-Message-State: AFuF++m7eT0egsD150xdPL5bURjFS/RNL3CEP2osvbv+TqbrzYKNToop
	NdWwp6goJWgyNUvVQcirPNotsnMqw5nGEBf1G5Xc2J+YzRl4BdpVmMcXKO1pgT8oHNYJcCkfsJE
	X8w4oIw==
X-Received: from plbd17.prod.google.com ([2002:a17:902:f151:b0:2dd:4fe2:d786])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2349:b0:2dd:c100:4b73
 with SMTP id d9443c01a7336-2ddc1005ee4mr92390435ad.42.1789999874739; Mon, 21
 Sep 2026 07:11:14 -0700 (PDT)
Date: Mon, 21 Sep 2026 07:11:14 -0700
In-Reply-To: <7efe2260-5c11-4e8c-812e-dd1e215ac3e4@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260914181223.289061-1-seanjc@google.com> <c645070e-9829-4f98-bafc-b5d44ff2db45@leemhuis.info>
 <7efe2260-5c11-4e8c-812e-dd1e215ac3e4@redhat.com>
Message-ID: <arE7AjkOyuadAFBY@google.com>
Subject: Re: [PATCH 0/5] KVM: Serialize vCPU creation and revert vcpu_ids tracking
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jean-Christophe Guillain <jean-christophe@guillain.net>, "=?utf-8?B?UGF3ZcWC?= S" <spawel523@gmail.com>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="us-ascii"

On Mon, Sep 21, 2026, Paolo Bonzini wrote:
> On 9/21/26 15:57, Thorsten Leemhuis wrote:
> > On 9/14/26 20:12, Sean Christopherson wrote:
> > > Serialize vCPU creation by holding kvm->lock for the entirety of
> > > kvm_vm_ioctl_create_vcpu(), and then revert the now-redundant tracking adding
> > > by commit 97d65b544f48 ("KVM: Check for duplicate vcpu_id as early as
> > > possible").  I botched the math when justifying the vcpu_ids tracking; it's not
> > > an extra 256 bytes, it's an extra 2048 bytes.  Roughly doubling the size of
> > > "struct kvm" tripped x86's KVM_SANITY_CHECK_VM_STRUCT_SIZE, and obviously isn't
> > > something we want to do in general.
> > 
> > Hi Sean! Thx for handling this and sorry for pestering you, but I have
> > to ask, as this fixes a regression that was already reported two times
> > and introduced this cycle:
> > 
> > What's the plan to merge this? Is this aimed for the current or the next
> > merge window? Ciao, Thorsten
> 
> For this one, but after fixing the PPC and s390 cases.

Ya.

> Sean, if you're busy I can send the v2 myself.

I'll get it out today.  I was traveling last week and got behind one a "few" things.

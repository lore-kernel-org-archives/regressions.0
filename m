Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8917D40DFB3
	for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 07:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273594; cv=none; b=rS8SCDLROUeBd4Zn0oh4e+1CDabgaVeEgUrdSn0NQpHZqMjYKE4+eBAkBJBIi9xZXgWSqyXNlPd/y8IpCncRp0Y7RMD89sHe/MehC1BG7suemrA6L1Qj46HCg+BHZ8qU9frRPAa2mi/+R2oFYJV6BpeEvG3rM0nPrzxV2tUNfkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273594; c=relaxed/simple;
	bh=QPRD0dFfCvef1eruEXtc9WQXEZWajAjrT4tystAAUdk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Hupq7YlGnTHVAUwx9Do2/Dxna+8Qp2Z0m7cnVQXOBkCqnnHN+OCmebPj8tGGqqCMrBytqyXCzANeUa2kuVDrdLkOGSeLQlh+SiU3VKN0J6WmNpEEhBNJXK9jeVMsQ46ADseBj3u3kwgAfiulB/poySZ/E51JZyGtKaBB019t19g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AUVwEd6i; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AUVwEd6i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777273591;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y7/7InQ3YxlIclzI7DLSo4lq3zCq3+EvHj491D6ofKI=;
	b=AUVwEd6iufboI/qHqUTRMKKtGd2SfIWD3yqB6QcmANQ9L2+Gw+bIvHcPfge/qxg0Qb8VKq
	yGeQYJ65dOfeBIisawLRThrF8Bmk67f1Eipac6GNRejE+zAM3fM/MK0MKDSp74wjlZJ6VR
	EwczYKGXGQ9wF65Tj3pWdBw730u8Ruk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-330-COmrkNHAP0e5g2ifgSTz9g-1; Mon,
 27 Apr 2026 03:06:26 -0400
X-MC-Unique: COmrkNHAP0e5g2ifgSTz9g-1
X-Mimecast-MFC-AGG-ID: COmrkNHAP0e5g2ifgSTz9g_1777273583
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0014F18004A9;
	Mon, 27 Apr 2026 07:06:22 +0000 (UTC)
Received: from fweimer-oldenburg.csb.redhat.com (unknown [10.44.48.4])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A35AC19560AB;
	Mon, 27 Apr 2026 07:06:15 +0000 (UTC)
From: Florian Weimer <fweimer@redhat.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Thomas Gleixner <tglx@kernel.org>,  Mathias Stearn
 <mathias@mongodb.com>,  Peter Zijlstra <peterz@infradead.org>,  Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>,  Catalin Marinas
 <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>,  Boqun Feng
 <boqun.feng@gmail.com>,  "Paul E. McKenney" <paulmck@kernel.org>,  Chris
 Kennelly <ckennelly@google.com>,  Dmitry Vyukov <dvyukov@google.com>,
  regressions@lists.linux.dev,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  Ingo Molnar <mingo@kernel.org>,
  Mark Rutland <mark.rutland@arm.com>,  Jinjie Ruan
 <ruanjinjie@huawei.com>,  Blake Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <CAHk-=wh=B3fqU9AaBsyViZR=eVTG5qa2CGyN=qxPROVxu9Gctg@mail.gmail.com>
	(Linus Torvalds's message of "Thu, 23 Apr 2026 14:28:35 -0700")
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
	<20260422125647.GP3126523@noisy.programming.kicks-ass.net>
	<20260422131338.GI3102924@noisy.programming.kicks-ass.net>
	<CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
	<87fr4l28zn.ffs@tglx>
	<CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
	<87cxzp1tn6.ffs@tglx>
	<CAHk-=wjsEqWJxXArS-P5+ksSY2Apaox8u6FtUrtyWSBEOL4Q2Q@mail.gmail.com>
	<874il11jac.ffs@tglx>
	<CAHk-=wh=B3fqU9AaBsyViZR=eVTG5qa2CGyN=qxPROVxu9Gctg@mail.gmail.com>
Date: Mon, 27 Apr 2026 09:06:13 +0200
Message-ID: <lhuqzo051cq.fsf@oldenburg.str.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: zfQn1E-I-KYYveTEsEM2BD43ASoALgEmlUe4Wx7g7PQ_1777273583
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

* Linus Torvalds:

>>     // Note: this makes __rseq_abi.cpu_id_start unusable for its original purpose.
>>
>>     Do you seriously want to proliferate that?
>
> Absolutely.
>
> That's how clever hacks work - they take advantage of things past
> their design parameters. "If it works, it's not stupid".
>
> We don't then turn around and say "you were clever, and we did
> something stupid, so now we'll hurt you".
>
> This is all 100% on the RSEQ kernel code, not on users who took
> advantage of it.

RSEQ was intended to be modular, with more than one library using it
within a process, without coordination (beyond sticking to the RSEQ
protocol).  The tcmalloc approach is incompatible with that.  Once
tcmalloc starts using RSEQ in its peculiar way, nothing else in the
process can, and vice versa.  This is far from ideal because the
particular descheduling notification that tcmalloc uses could be
implemented in a much simpler way than full RSEQ, given its non-modular
nature.

Thanks,
Florian


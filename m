Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E3220766C
	for <regressions@lists.linux.dev>; Mon,  4 Aug 2025 14:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754319046; cv=none; b=JBuU/Bv+LUv+G1KDfSjWESbI13GdXbGBJhDHgWxLqs2s9S2ObcfRI/RVpK1tnF0IowCaYzhurjgxbrW4XS/doQl+YlKmfbjJal1F651GIRDTQNa4TmL4QgM0TC7PPsDwABVyKe9gvDTezGlYcUXgioqJACjF0sMRhbuPqmDO8mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754319046; c=relaxed/simple;
	bh=Th/zbNG2w/sGAVRFlv12HJ6Li/jSTJBgQ6X2ZZll/S0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EHWeyLnF8AbubBlWr9BJy0NCpE9onAmo1YPw8Pbtb9N5JQe0zdp7oR6ZO4AOiluzMLeicG3UjQvxY2KHjKCY4prWT19/5CQKGqyuAUeIyES+Js9tRbiFEuVt0CWLt+bfEsOnGQEP2aVU+h8vRtkofGsX1ecGGyZxYo9nJ2obWj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O7CmMmct; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O7CmMmct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754319044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Th/zbNG2w/sGAVRFlv12HJ6Li/jSTJBgQ6X2ZZll/S0=;
	b=O7CmMmctRo8TFZp9kSQeC6rDb/zMSZ0HCHtbqtVv/qprOjythyKSwsXPkdGKeC+prscCG/
	iPvAZr3GrJvnAGlgdvZL1vLCszCYW18ffDvPJgI81KeCyUBP4qNSgYJg07OJPuAKMc/aCW
	n6sAfIZsr84pmte4/ictBb0pPG34+kQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-pydCRLxvMKG92F7JZswPRg-1; Mon, 04 Aug 2025 10:50:43 -0400
X-MC-Unique: pydCRLxvMKG92F7JZswPRg-1
X-Mimecast-MFC-AGG-ID: pydCRLxvMKG92F7JZswPRg_1754319042
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3b7806a620cso1995955f8f.3
        for <regressions@lists.linux.dev>; Mon, 04 Aug 2025 07:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754319042; x=1754923842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Th/zbNG2w/sGAVRFlv12HJ6Li/jSTJBgQ6X2ZZll/S0=;
        b=GxO/F8CEOeshCDSKG4Ho+i7sk0O/mkxwqHlYoD/8qCkTB0dt+VgU1ff417KCrt6x7S
         1Po5kv0IgxZOc0HsgoORPB9/oOsS8O8AgiQ+SNrc/f7n0AtgjPTTSu3m1pMcaSP6TSaZ
         BagoGFTPeDstTY+LSd+L5HyIP/tYLc8SB27ly47/Rdzf4Uh5zYhE77soSt0b1BvOFfe9
         THHcpbdXrynUH5Uya44agz0STq2EXnB2+R8+OB9XJO3eOwgxtf+Cwqx5PzZJEKjr1jC+
         JzlXlWXbNmv66MTvdBplNZYy1CJrYmNSVO0au0fWHJlOaUIUAeheELFhIYfFXV6ofZca
         uRSQ==
X-Gm-Message-State: AOJu0YwGkdjrg0vrNFFO8not5QChHI0Wc/N9KxHhRPejsbrka/7LHoNQ
	y5nxXZSzannAOoshfwZxXq260+NSYy+/ep6YOqbmXF0ZF0pbYwzhy971wTWXoidHAHjSSdiKeSH
	SDt5yHvV1Q+6wlUPCQBQCaYyivBpP0xfY0NJmQWAdgcnaywaZlmqZCMV7Hk0bLgvTPGqoF4l7AP
	k6fPqGWhhP26e2UVh3pJ1ybyF0srROq238xyZu6qM=
X-Gm-Gg: ASbGncsYl0RcaBxcR3as6n2lIMGWQ+w9Glf9yb/kHQEAhhNdQd39WlkPpvi553FlFhj
	HtF4A5NfQmr2T59ieU8rs8zFak+zZgu7FwSZ5VcxH6czU5er+ZWPFhDjGqNf4b55iE+vCKNAlA+
	hJpR9Qe+ehLwLa5l3GsUs3
X-Received: by 2002:a05:6000:1788:b0:3b7:94c3:2786 with SMTP id ffacd0b85a97d-3b8d94c1c49mr6701554f8f.34.1754319041976;
        Mon, 04 Aug 2025 07:50:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgsw4pwEJUoqykoSclSWi0JkSR9VtvKkMXz/zduARm+hjzykjvBGRpvCt0a+Ds377veRWW/i7OVVOUhVwFvkM=
X-Received: by 2002:a05:6000:1788:b0:3b7:94c3:2786 with SMTP id
 ffacd0b85a97d-3b8d94c1c49mr6701520f8f.34.1754319041488; Mon, 04 Aug 2025
 07:50:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACTEcX6oXBot1VBApOyKVMVXsAN9BsvQMLa8J0iKpNeB-eLttQ@mail.gmail.com>
 <642d439ea1be8e48ee5c47fd3921a786452fb931@intel.com> <CACTEcX5Y3PNXNkhnK1dGFe+k3sigOZNpj66KKGAS9XeHqRu35w@mail.gmail.com>
 <0b15e33603a46f6cc7ad7d09a156044f11367169@intel.com> <CACTEcX47bUd2tp=LYkQnhK29Js=vLN0JfXL8Aq6mOFBVYumpzQ@mail.gmail.com>
In-Reply-To: <CACTEcX47bUd2tp=LYkQnhK29Js=vLN0JfXL8Aq6mOFBVYumpzQ@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 4 Aug 2025 16:50:28 +0200
X-Gm-Features: Ac12FXwltMgUzEEB8nqMLRA_D51YfOsfFkH1rt4nc_9cVgH_FR6V2EdEIAFZooc
Message-ID: <CABgObfZKKeqMrAUyS8CB4ARkW_8Z9QREgpgYcq2jxoQ9ppS6MA@mail.gmail.com>
Subject: Re: [REGRESSION] tty lockup and WWAN loss after hibernate/suspend in
 6.8+ on ThinkPad X1 Carbon Gen 10
To: Andy Mindful <andy.mindful@gmail.com>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org, 
	rafael@kernel.org, ville.syrjala@linux.intel.com, tglx@linutronix.de, 
	Christian Brauner <brauner@kernel.org>, Jani Nikula <jani.nikula@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8Ueze888F53GlCBvfNsMWQDZdw2TtRGSJRiLD9mOm94_1754319042
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 4, 2025 at 12:57=E2=80=AFPM Andy Mindful <andy.mindful@gmail.co=
m> wrote:
> Double-checked bisect, looks like I've have found broken commit:
>
> > > git bisect bad
> > > The merge base ba5afb9a84df2e6b26a1b6389b98849cd16ea757 is bad.
> > > This means the bug has been fixed between
> > > ba5afb9a84df2e6b26a1b6389b98849cd16ea757 and
> > > [1b1934dbbdcf9aa2d507932ff488cec47999cf3f
> > > 61da593f4458f25c59f65cfd9ba1bda570db5db7
> > > 6fc5460ed8dd0edf29e7c5cfb1ef9b1aa04208a1
> > > ba5afb9a84df2e6b26a1b6389b98849cd16ea757].

This skip is messing up the results:

# skip: [0dd3ee31125508cd67f7e7172247f05b7fd1753a] Linux 6.7
git bisect skip 0dd3ee31125508cd67f7e7172247f05b7fd1753a

and there are still 3858 commits in
ba5afb9a84df2e6b26a1b6389b98849cd16ea757..{1b1934dbbdcf9aa2d507932ff488cec4=
7999cf3f,61da593f4458f25c59f65cfd9ba1bda570db5db7,ba5afb9a84df2e6b26a1b6389=
b98849cd16ea757}

Any chance you can get 6.7 to work and restrict the range further?

Thanks,

Paolo


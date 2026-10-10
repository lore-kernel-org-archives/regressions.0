Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A073225B08D
	for <regressions@lists.linux.dev>; Sat, 10 Oct 2026 10:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791628395; cv=none; b=GmMBp7wa1NLpHfxkfXUngC25yry1HRZe1dm97GI8tmzqJieDP7PfZj6RksU6DXWvzg6fN9S4Hzxbe3+s/ksTFRyo3vlnMQ6FtdobbngIiYsQ8fm+f26SBSDaXjGK5kcNtVZEPYLbm76gzS8YqiKwIWTBIgC6q6gomCzeiDjB/xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791628395; c=relaxed/simple;
	bh=cXpXyyAxJEQk85gzl9TTiU5pF79hr7iF/5HP6KNcpRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fSibOyGcf2jAWhg3lp0Bbv4akIcI8Rf86AkxhUkIQpKUmFnKmWQlriKoKFkHjKmKKFLtOt/W7Yo5XFuWHgiO+B5NH2sYpSr0o/M5WhDMo24XM9EPUGFs0NKStt19wrQK/An+oL15B2Ps42VdgiIffPAPRL6E35OAU5o+P7tKlpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HgnV/I92; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HgnV/I92"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791628393;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uW5cF2qGp1fynNQG0JX/YHgwzhjHkih1Eex3WwO1Nwo=;
	b=HgnV/I92kXG01DTKMkUrP2dX39BoAXibQbyQoob/tNrAJcuHgbkLCmfYQS9k8Ywes+MwZq
	RisB6mUykI8mh7V1hiKDPeBQRILWpR5F74PFyG1HFTe+BEkFlkN9roAEef4i1Kn40TxQt8
	AHjuOhXsDHZqjbcpN7vDEVuZQmWiySU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-115-U1XRIZGLOriN84BmfV1tSA-1; Sat, 10 Oct 2026 10:33:12 +0000
X-MC-Unique: U1XRIZGLOriN84BmfV1tSA-1
X-Mimecast-MFC-AGG-ID: U1XRIZGLOriN84BmfV1tSA_1791628391
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1895ffc83so4133295e9.3
        for <regressions@lists.linux.dev>; Sat, 10 Oct 2026 03:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791628391; x=1792233191;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uW5cF2qGp1fynNQG0JX/YHgwzhjHkih1Eex3WwO1Nwo=;
        b=hULHiU0RG6tRlnXEyWAwZyO8HNwouAhUZjiwTNtJ4KzNTtHjJlDSD8kJYlMmTdtf89
         8jFHW+fswRn2mKiBmiQyjRjI4aOs55V8DxM1obDdR9+MMYoVv8/f0XQ+Z0WowauZSdtl
         HjrfimpTiHBB0N4fU6Bn7oZcLdmqDjTfePbXlm3icPiFYrC8EM0ReZpFntTjj6z4fTdf
         yPI9PIGQLlkm5bRTVvSZTKyk/NgKAN4M/AgsyY0ihRogKlMq9xFEqZUO9ZmJAK4DIjS9
         zeQG4vqCCbckzw8wnSlWhNl5vsNC3owbvlCKomyvx+fChDwsIxbQ5xG+W76WJP4cRIt2
         tMRQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/P2pdEqDAg+3eNR2nM2c3oymLgoJRsQwczcHjIVfSBtHmh+M1jLGANE6cUBXe9EiNi+ivojFY3I6gbQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYK+VWLGXgPKHWrR+3A6gFEsCO+JazhJh8J9RI04xAIJCXn4bzXu
	zTzKRJglCiJANY2+9EXEyjTrmWj7ejLT8/LmUAPXc6HMRnX4boZtXLByAkETIP1VSS1A9ujLTkb
	946ZM3AgTPHVvm6OmWVgEvfisloGePvrHKVjT4trB5zx83qxQLDnqXlLIpCeddnwP
X-Gm-Gg: AYBFou1iUtiWFC3na/l8sHuj7WwTPj0SELfzX0VLjAW2Xeq0rDGa5gvcYEJPs5qAbNV
	MHchQj5NivZS2efOnAVOe8fAJHGT69yquS/u29N2/0hILmXwJA0EdnPNC3Ng8Uozplja2pjZ1Ns
	JqHMGXkLHmePNAs3o1qLgLO6I0M6dS5yt03UmV4qmF/fDeg86xYoPdaHY0zaXPc8QiQ+QXbfROe
	qNjXNjjt3xOuQk2jp+rOMs0GrMVA03rJQPj5f8jOuoa97MjncB6D3WAfe+YZCEFKDqGxHqehLQY
	lJ45TJxli/vKVeUxcMcM+l9N7S7LWh78WNs50xg4PF7eF7vTxyhhqW3sqogMYPAJeOWvoFA=
X-Received: by 2002:a05:600c:3510:b0:4a1:7033:5b55 with SMTP id 5b1f17b1804b1-4a18e4cc437mr94488425e9.21.1791628390808;
        Sat, 10 Oct 2026 03:33:10 -0700 (PDT)
X-Received: by 2002:a05:600c:3510:b0:4a1:7033:5b55 with SMTP id 5b1f17b1804b1-4a18e4cc437mr94487985e9.21.1791628390226;
        Sat, 10 Oct 2026 03:33:10 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73fb:d100:601d:d7d4:d03f:527b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c3a13sm8328544f8f.25.2026.10.10.03.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:33:08 -0700 (PDT)
Date: Sat, 10 Oct 2026 06:33:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Sasha Levin <sashal@kernel.org>, workflows@vger.kernel.org,
	ksummit@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, rdunlap@infradead.org,
	broonie@kernel.org, tytso@mit.edu,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH 2/2] agents: add a skill to determine Fixes tags
Message-ID: <20261010063228-mutt-send-email-mst@kernel.org>
References: <cover.1791499378.git.sashal@kernel.org>
 <7fa126fd22b4449cf63a7045f7cd959e106fac87.1791499378.git.sashal@kernel.org>
 <c3ce794d-1ac2-4ef3-9e5c-1e171bd77a89@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <c3ce794d-1ac2-4ef3-9e5c-1e171bd77a89@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OwgRnB6uYPwE4_8lZlXfzq45ZgaTHJBo5LkcIurrnCg_1791628391
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Oct 10, 2026 at 11:40:56AM +0200, Thorsten Leemhuis wrote:
> On 10/9/26 00:54, Sasha Levin wrote:
> >
> > +A ``Fixes:`` tag identifies the commit that introduced the bug being fixed. [...]
> 
> Sorry for partly hijacking this, but it seems appropriate while we are
> at it:
> 
> What exactly is the right commit to specify when it comes to a
> regression caused by a change that exposed a way older bug? The change
> that exposed it? The change that introduced it in the first place? Both?
> I'd tend to "both", but I guess some people might consider this as too
> noisy.
> 
> I've seen occasional discussions about this and our docs for humans are
> a bit vague here:
> 
> Documentation/process/submitting-patches.rst says:
> ""If your patch fixes a bug in a specific commit, e.g. you found an
> issue using git bisect, please use the ‘Fixes:’ tag with at least the
> first 12 characters of the SHA-1 ID, and the one line summary.
> [...]
> A Fixes: tag indicates that the patch fixes a bug in a previous commit.
> It is used to make it easy to determine where an issue originated""
> 
> And Documentation/process/5.Posting.rst says:
> ""One tag is used to refer to earlier commits which introduced problems
> fixed by the patch:""
> 
> Ciao, Thorsten

I'd say the one exposed it. this way it is useful to answer
the question "do i need this fix".


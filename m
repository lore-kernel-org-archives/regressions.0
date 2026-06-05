Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E749347DF86
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 07:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780645348; cv=none; b=FoYEj0lj/8P9HJI+huFt+gX4gUuMmKlBztXcTx7RsB+buWimhl44OI0fuJP3uTp4vEuKfZu23rghPRWjSxiL+/7eDNTL76Nu38G0GtCIIz9DAa5Xk+6X7aef5RhxUVLCa7s9gzQRZjsSi1Tx1l8eAGl4I0tlC7NPHfwiL0dGXyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780645348; c=relaxed/simple;
	bh=zGBQseIGQbruX3+uF9HVhd5pi/SISR7KNX7erelZICA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dQLGYTTtSaJoklEUHpUbD8Aw+ZNDeVYPFrEkTRW6c89YBesdD4GiSGhWlWWXDrVvjMfX1Ax8XDH135ifHKGFhYY8AJ6cESsMmwCCyBFJ0M4ksurTSoWIJ8l5Fp+c/QOmKsZ1lSeHxZcBNCT401p3lVlGo+7GcHbxASJhyP7u3c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BfZ9NUMX; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BfZ9NUMX"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gWtgY2hmdz9tSw;
	Fri,  5 Jun 2026 09:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1780645337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HMgUcgbliuW0O9oKzyYh13yjBTCej89mTEZ41tXG0kE=;
	b=BfZ9NUMXT7K805n+3uWei27aK+AtoE7V7H7m+WwOv4yQ/9XrKfvmhhEyVSKa3YMZQWiZKn
	JP/TtSkRajgu/sO20Nz8nHoMT73qm0y6Lrxi0quudOVdGhDVernmVduw7ZbAocy8e6L06a
	DgqDZ5QDorNaVyK7kevTzKLjgUJxZeZCNE7nUL37nxx0++5cIvXDYA4tBI9dgINYxLpP/J
	QvxMZsmSU3YNZ+sckh1Z/0kq8vRqkddqRvpdRzHbg1P9aEXjUC3C7swH6PfUpwmTQ8VGrr
	SkI+fQKuZ3UBsW8A0vgZwvtHt2rPQvMQXq8eK7i/JoFKKK48/RrzRxvar68DMA==
Message-ID: <ebe757cd-59d2-4590-b2f8-1e75a789fdb8@mailbox.org>
Date: Fri, 5 Jun 2026 09:42:14 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [External Mail] Re: Test result / finding of "drm/amd/display:
 Consult MCCS FreeSync cap only if requested & supported"
To: Pei-Hsin Yang <peihsiny@valvesoftware.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 "Wentland, Harry" <Harry.Wentland@amd.com>,
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <44069eb146824aa195312f5b02c49287@valvesoftware.com>
 <7a9021cd-fd78-4b0d-846b-135d0d72224e@mailbox.org>
 <16231b1742004f848af243ce398281ec@valvesoftware.com>
 <ce51243c-3b98-4f99-911f-70dd0b860da0@mailbox.org>
 <1c522568-1d5e-4210-8f25-1aa96e0d3c3a@leemhuis.info>
 <BL1PR12MB51447AB016BB28843BAD0216F7092@BL1PR12MB5144.namprd12.prod.outlook.com>
 <af4dff0f-0c62-4a7d-9a3f-fc029c8757f4@mailbox.org>
 <CADnq5_O9xMagapKQSO-6waXtmmFkDV-47ExVaNuiZd2xVdhefw@mail.gmail.com>
 <39ff584f-66ed-421a-918b-347d020a393a@mailbox.org>
 <399d0170414b4304823e866b04ab518a@valvesoftware.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA
In-Reply-To: <399d0170414b4304823e866b04ab518a@valvesoftware.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0821db636d736f4c1ad
X-MBO-RS-META: c3s3twhtc95fn9umw8hbkuobwdexeiri

On 6/4/26 19:21, Pei-Hsin Yang wrote:
> 
>> Note that Pei-Hsin reported an issue when running with my fix at the start of this thread, unfortunately it's still unclear if that's a regression of > my fix or happens even without it (in which case it might be another regression of the MCCS related changes for 7.1).
> 
> As I have mentioned earlier, my testing of your patch confirms that it is a regression even without your patch.

You previously wrote "There are other issues without your patch applied", I didn't see anything about whether or not the issue you reported in the post which started this thread happens without my fix though.

Anyway, thanks for confirming that it's not a regression of my fix, that's a relief.


Alex, since the MCCS changes caused other regressions, it might be better to revert them for now anyway though?


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast

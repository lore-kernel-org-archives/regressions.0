Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1804C625
	for <regressions@lists.linux.dev>; Mon,  5 May 2025 14:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746453637; cv=none; b=qrppSg+P2hipBfb8n6/PsuQiEv7JxDGXVu4i/Zv1h3xmfCtuwG9j23v26xQ4p0kZq88n+FGe8q+y2iiNR5f5RaKuF9e/mdsuwmvtJi5iZLmGn95SRHNWooysayJuMrDz64eAfseM6pFknl3oOauG5QFiD6bTxM3V2ppWQvu4O8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746453637; c=relaxed/simple;
	bh=8sx7iAwEY5wVEwk/YMijqbgIAFA0jCW8GzQqW/tcHzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hxjf64tR7y//wbBVlcZm3QesC727HOWaVuWdrmuseqfVW0bXPt3N7Nr5wx651vrM3pe69YU0+VrY1pCYo0G9bJAMfAEwXmUp71uO8YamtBCChy34lvcP8j6LL860uh5q9UCcw6m90rj9KMH+/dy/dVQX9YqFIwDrblqzGaBSkps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDcN+gJV; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDcN+gJV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac34257295dso41224066b.2
        for <regressions@lists.linux.dev>; Mon, 05 May 2025 07:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746453633; x=1747058433; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z4W415zBYc/FrcFDPh5CD7dEppC5URQ9rStPXLLgxUo=;
        b=cDcN+gJVWnEmUSq3VmaLYj4v8r4RxB8JiIMw0LfRW0Il0W2p3Dmu4XOuwcPqC1jlYw
         +xqiVAbEsdK6+4bWVUWUiJnIDtausSVFfJpdGLL6m2krGI4HYuf2fShGwY8TclnKulOH
         PEWvZjPczVRMuIwKqRQzxYVW08vc2poPVdcnyfkY+aXUVGCZfEVrRw+sQr430if1ZQ5k
         W20o9eK/KEol4MnrMepU1pYKUPdFbmN4jnzyn6jrt+/SJOjCcb9pk7f8mTnPVCgIxyXz
         RTv4AluH9bt/waxLkSNG7pi7QTBg6xNP2sMatCpjHs7tNp8RDQ6OzRs+7AqSk9xwla+e
         ZNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746453633; x=1747058433;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z4W415zBYc/FrcFDPh5CD7dEppC5URQ9rStPXLLgxUo=;
        b=BDCiSX6r4YXF7JpFjLtdRDLn1tOadVAnRCzqnNHLOXwH5wYRKkQldIoZQ6pcqxiSQO
         7ZEUKoxxsWWduF8eZjkGEPsXWyMpEMNysC9ZAdPOYDIeY3fYlB6IFlS8s9EJrkl/kn+Q
         9OcfZ521VhXZFUWBChshVkh9PEbwnP2I6j5weIAzaQ99hjfJF5QnMTc6pTNwxx4ZoN5F
         +Sg9e2hjxFcwaYpxMapcMvOWy3UWdtrkY5QxVbIL8cG0zYcBoRHsNOFMN3qA3xgrYNxN
         yGVY+Os/QmCgxjBBepWKQBGHfBmm3lAR9skMy/+eEtgjPwmxI57B0PuSdv6WV+PuZgaN
         iErQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQVoCArWPRMeM00eTpD3FZoskknW9t6ugyyhTp4Ub93xjrHS/+Bn+9JYYIB/q/xIJ78wojGbRiPeeAvw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwsKeAO+khhsesHdEAjbo0Z1jL15aguXcFJ+6600sK4XPLxL6do
	1PlFcrRMvUTUAqNCX6sEDlbwmPQblC3k4/NTN6nq3yJrLn6qh2sy
X-Gm-Gg: ASbGncupaC62L2Cl7fidr1WnNWoTs2sYjH+tSQ2mozQXpLthWc/61fFMAnbv522y/Y+
	u7i/WUXvcYhS1QsdGr5AxLJu4wg4HZ+ICGFNdZcGp45yGPewHRKAiWVVY5oQYo3Qgxu2/g/D7kz
	0ChMR4RtMDdqrnNaR8RZnfj+IP+e3/35jWuvLgOrQ/I76gwuJbtmvoV6+MQTMbMyGI2FFtLM7pt
	Lbbyo6SQJw5MKwhesd0YnJR4CsGn+zOVRiJiQ/QLOri9e/h9lV5+Dqby31jo7T+DrcN4USaW+kq
	pHG1vttVmNQt70PPhDsVjTgKVQ8mvyWk+kbsJORokGSLQYQxwG0wafqQCMj9y793HP55aHk3vA3
	B2k5Hyzn8
X-Google-Smtp-Source: AGHT+IEqvZxAOUpRWWOSk50ECa6+3yzmb1X6nK3mvLHxDq+btzuzepBxjyQWGpD8AtPBFgUV9KfA4w==
X-Received: by 2002:a17:907:72c9:b0:ac6:edd3:e466 with SMTP id a640c23a62f3a-ad1a491417dmr649282566b.19.1746453632606;
        Mon, 05 May 2025 07:00:32 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c032fsm492456566b.123.2025.05.05.07.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:00:31 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 26597BE2DE0; Mon, 05 May 2025 16:00:31 +0200 (CEST)
Date: Mon, 5 May 2025 16:00:31 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Moritz =?iso-8859-1?Q?M=FChlenhoff?= <jmm@inutil.org>
Cc: Yu Kuai <yukuai3@huawei.com>, Melvin Vermeeren <vermeeren@vermwa.re>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	1104460@bugs.debian.org, Coly Li <colyli@kernel.org>,
	Sasha Levin <sashal@kernel.org>, stable <stable@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: [regression 6.1.y] discard/TRIM through RAID10 blocking (was:
 Re: Bug#1104460: linux-image-6.1.0-34-powerpc64le: Discard broken) with
 RAID10: BUG: kernel tried to execute user page (0) - exploit attempt?
Message-ID: <aBjEf5R7X9GaJg2T@eldamar.lan>
References: <174602441004.174814.6400502946223473449.reportbug@talos.vermwa.re>
 <aBJH6Nsh-7Zj55nN@eldamar.lan>
 <aBilQxLZ4MA4Tg8e@pisco.westfalen.local>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aBilQxLZ4MA4Tg8e@pisco.westfalen.local>

Hi Moritz,

On Mon, May 05, 2025 at 01:47:15PM +0200, Moritz Mühlenhoff wrote:
> Am Wed, Apr 30, 2025 at 05:55:20PM +0200 schrieb Salvatore Bonaccorso:
> > Hi
> > 
> > We got a regression report in Debian after the update from 6.1.133 to
> > 6.1.135. Melvin is reporting that discard/trimm trhough a RAID10 array
> > stalls idefintively. The full report is inlined below and originates
> > from https://bugs.debian.org/1104460 .
> 
> JFTR, we ran into the same problem with a few Wikimedia servers running
> 6.1.135 and RAID 10: The servers started to lock up once fstrim.service
> got started. Full oops messages are available at
> https://phabricator.wikimedia.org/P75746

Thanks for this aditional datapoints. Assuming you wont be able to
thest the other stable series where the commit d05af90d6218
("md/raid10: fix missing discard IO accounting") went in, might you at
least be able to test the 6.1.y branch with the commit reverted again
and manually trigger the issue?

If needed I can provide a test Debian package of 6.1.135 (or 6.1.137)
with the patch reverted. 

Regards,
Salvatore

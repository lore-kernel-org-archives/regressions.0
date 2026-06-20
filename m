Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B9D5B1EB
	for <regressions@lists.linux.dev>; Sat, 20 Jun 2026 20:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781988287; cv=none; b=mYH/G834q4cMEG+ozK6zX8k7DM9tqhUmiq7QBfZqM/5OhsAQ3acH3uH8kaK0olvOP8Q8WDPbFUz97bMlzOlGMk8h2LtxSuixloNNYCqS0wL3XvHHRvmy0a41iq8K2uhOgWa6j4+8xm43P99Um4AygISr6pc5YMWroJfbWLHwvjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781988287; c=relaxed/simple;
	bh=U7AqPRs5Is8Is9SjOZmekPXBSghQ5JGw1UeCdOvvZvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYg7UXVN6BtyyiugIjimyeIzoUlxg02V4Pcu+tQVvnQW8VhJ/d433nRabJBaU1+7autPYyoWLFsvP/IVLZDggq31+gCir/AIRRp/N2jk/bEUB2BBotqr8cd8IvHTVH8oVT3qaNmieJVbkNrjvZ2WPrTLKWJ4hyu73jHh9PtUuaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Su+MbKV0; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Su+MbKV0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4633193af19so2212400f8f.2
        for <regressions@lists.linux.dev>; Sat, 20 Jun 2026 13:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781988285; x=1782593085; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KEJeIuAOhsEHJ09iO7qVlqN+PvloGiCYoriT6c3hYsU=;
        b=Su+MbKV0JRwDh6EUG7dCjx1vtzrMvk8Ciz01qDabTMKOaTZN3LlmAM7ElqsMn2BRHk
         gU8ZQ6mlAI7/HUoPQ0TfkpQ8YOSY6OU2Q+OKxCTIIFIC11czryqObEKJKww/myKM/MI0
         SWv/B+W+fw40/oLrMiA4nr1hNj4Qy47zaf2rMQHoqmUa6a5IPeQHzlXNZ2xNCa24TUQG
         IJo0gTTPv+Ii87rWtVzYa6k0epPuM5GfApQPPZoPzYI0YBOGf+Q2dxGXlE8D+6RcDMxU
         OZMYXMqo7aTgX2x+ajAyr2yYTVARmkAwChmhe4zY+llfkE8rV8MMBdRZgZ4i5Bb/yX4U
         jXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781988285; x=1782593085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KEJeIuAOhsEHJ09iO7qVlqN+PvloGiCYoriT6c3hYsU=;
        b=UukfRzchg7U6fgmViQ4DvRp9f3ykavpBoI1F6Cvaa6/509bufMr3hpk1N5L93ZM1sb
         nFuRv7lNz9LLJXGvzMnzPnO/7imyyqCiupAxplYZ9RTDbZxR98hbLI2BRTcpLAbvEh1H
         bJDbpOcb60/ohZTsUOZuSzj+ApfkHzDCglNXyWUe9rIw8X2nruc0pNQdsaEodfYBnhDM
         8LQrvVC6t70XzbHMZ5Wo32Xdye11S7bHTBhFgWZ+KpCgncDyxpm+m0K13HWTl2ZMWow0
         E0OqxDCb432p8TGp6OYwbthsn+xLvF3Oo3c6QRV7UuNFCFO7mjzTUYonjgLDV/Iri5rS
         +Exw==
X-Forwarded-Encrypted: i=1; AHgh+RrOUTChPyehzXLIZCNRvUQJgIqt+qqY4MR1Ega4lCm0AFLYeFRxgTS4PvGyhJYtFznefnAfnJMYI9/XsQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4hoa+NgdtJtH9KJse3APrlAF5G8UrfmT7/kbhYDDJGoqJMR8b
	UHzOVYfxc4RI8ursOmfItS8H8xhe6s3vu+p9gNJS89CsZBDNCp37rHDb
X-Gm-Gg: AfdE7clsIPHAnXqsgxF/WRBVFU9DFy5KhNFJ64nPyxwMda84EugM3rXixq0eSk0TJ/P
	vvDgt46/QU0c6idnCFq5I4gN7sCXDIVVINj37i0YeECQov05roRXn0pa1/mdpK8EUpqKVysRTNP
	xNQCMsc+oVIBio5mR0SpvgzcVcQj5XvMkMbhbq/YrFeFUoyWBXVVwHVtGPz3cLtbXF/w0ITstLj
	8OEiwSRbar6euQHEWIiXvUy5ORVkHg9/EPqwhw3LvNccK4tNJoeHbHp9K5sg4xjAYUjyATaAVRW
	UU01/M96SMxhEu1+ofornNYVt30Y+EhdYY+lH1O5+hTYzsLPg5RWTJsG6KM0qvyiT6aGl01A1f2
	oZjSlELjidn+U+BS+N9xeCmDxUWtgbM+CgaYQUYUlyefRirIscQTQKHbP7p+GfB93CaGbaIOTcP
	DhGx8cYZ2Mra8yFIp5+4z7GT6Ro+ZsjQuVGsLTAU6t1f0OF6m0
X-Received: by 2002:a05:6000:46d9:b0:45e:ed7f:1dd with SMTP id ffacd0b85a97d-46662334b91mr4727341f8f.25.1781988284592;
        Sat, 20 Jun 2026 13:44:44 -0700 (PDT)
Received: from eldamar.lan (c-82-192-247-196.customer.ggaweb.ch. [82.192.247.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466643f4e93sm12184790f8f.7.2026.06.20.13.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 13:44:43 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 41C3BBE2EE7; Sat, 20 Jun 2026 22:44:42 +0200 (CEST)
Date: Sat, 20 Jun 2026 22:44:42 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Alejandro =?iso-8859-1?Q?Oliv=E1n?= Alvarez <alejandro.olivan.alvarez@gmail.com>,
	1130336@bugs.debian.org, Florian Westphal <fw@strlen.de>,
	Pablo Neira Ayuso <pablo@netfilter.org>, Phil Sutter <phil@nwl.cc>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: Bug#1130336: [regression] Network failure beyond first
 connection after 69894e5b4c5e ("netfilter: nft_connlimit: update the count
 if add was skipped")
Message-ID: <ajb7ugG5mYxYIPva@eldamar.lan>
References: <c72a56ab-a16c-4866-9a44-a03393f074db@suse.de>
 <b3cbfd15-acd1-4500-ba30-eac6f48523fb@suse.de>
 <abW2MAAqLnKZm3KF@strlen.de>
 <177322336258.4376.10097494324750307114.reportbug@Desk1.simalex.iccbroadcast.com>
 <4da571ab-fa1d-4ee6-b71c-24f4a28243ed@suse.de>
 <abqfSB0TUik1kRU4@eldamar.lan>
 <e24a281622cedf9e8f4dc93c961813aeb7b6ce4c.camel@gmail.com>
 <8788e351-553f-48da-a6e6-ce082adacb8d@suse.de>
 <0b8607c8-2d29-4fca-961a-b7a677e968a1@leemhuis.info>
 <f67a985f-c6a0-4796-b255-59d99e317b6f@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f67a985f-c6a0-4796-b255-59d99e317b6f@suse.de>

Hi Fernando,

On Wed, Apr 22, 2026 at 12:32:34PM +0200, Fernando Fernandez Mancera wrote:
> On 4/22/26 11:18 AM, Thorsten Leemhuis wrote:
> > Lo! Top-posting on purpose to make this easy to process.
> > 
> > What happened to this regression? It looks a bit like things stalled and
> > fell through the cracks. Or Fernando, did you post a patch like you
> > mentioned? I looked for one referring the commit or the reporter, but
> > could not find anything -- but maybe I missed it.
> > 
> 
> Yes, it stalled and fell through the cracks. Let me prepare a fix as I
> mentioned.

Did that happened? On a quick chek at least 7.0.13 upstream seem still
to exhibit the problem (or would it be fair to let this usecase rest?)

Regards,
Salvatore

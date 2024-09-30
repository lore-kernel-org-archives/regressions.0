Received: from dormouse.elm.relay.mailchannels.net (dormouse.elm.relay.mailchannels.net [23.83.212.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1391A3BD9
	for <regressions@lists.linux.dev>; Mon, 30 Sep 2024 23:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727739697; cv=pass; b=L7rQw7THfXGIzVSoEx9vLnlXJEh7oL0QLoz71OUlEdirgurFMMTMHdwtVubYRsf7LDcY/F+uYPhkHDcnPsKQE1iGUFcxlVG+oSV9wjEPPoo1yi03X/lu568aNmK6dHk3Vb3U07epVEp4fmRRKbgYVBmo85Hmm9FftWYR8Tnqrys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727739697; c=relaxed/simple;
	bh=UZjevEb+aS9Z63T3PhLuFwnTl0m/XfMMUJJ9gK77NXk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rhC7s2ZACsCGcbCC7imOMH552YiOCwcmS9ArNzDJKNinll4EIoTLkvgHM5rWr1XAi84BEI0Yj7b8Dr6y+xIdrO2Y1UK4A7JjHbexaB+oSw1tMDzcVC8oyuRKtgfGlcS5UtvRBbnkvozmHh9Lmn7uxg+UQBQ3D6/8wtnq103tkzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=pass smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=aJ66WVtF; arc=pass smtp.client-ip=23.83.212.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="aJ66WVtF"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id C49C3877F3;
	Mon, 30 Sep 2024 23:02:00 +0000 (UTC)
Received: from pdx1-sub0-mail-a315.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 567D187790;
	Mon, 30 Sep 2024 23:02:00 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1727737320; a=rsa-sha256;
	cv=none;
	b=Ui2hSs7GgIhX4NwUwrhzLnWJ6QAiIDsDlnAEyw7vdsWF5Z9SHAT7DiQjOqQeouhYa0zofR
	UfmhY7y8pN2yly+OTm18mUOR0RBeARpF9YH/QGPS2xnWOUZABn8qd9td388PNumi87gs9y
	MrtYRaHMXNze7OUh6H0ttuOxRzy7gR3RL2W7FDNZ7HvBDTXdVGCZ+ZY9rDiCbrRMNHc5k+
	Y9BOR+L8bhTTLYiMfm2bRZ7Q/iPmikXabppaUrniWqIZTbR9rN2haj3qIn8Sa7/O5j0upp
	EcImNoUB4kgShhl6JNPDuuAhccbQ05fnw03t5KwYLrZxUOqYK98j/LNFPN6OUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1727737320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=UZjevEb+aS9Z63T3PhLuFwnTl0m/XfMMUJJ9gK77NXk=;
	b=BL+z4FsSjYGaeN4JrxZ0kvgtVtlyTJu2rloiY3mZ1alW+M+Ik3pb2cZfNPJFi6YLRGLRtD
	TVNbdLxEy5tw9YIFOLXpQf2NP4yr3z7ascWKeboF3LeIKOy1R2fToCMU5HZg0/m9eP1eCG
	gxipDsBZX5JNWa/H5RKM3Fv+iwyXG45fFw3C49g8EXcuQgz8W/WFgghvBy4Ltf33tkaqyj
	upjeujNDsMsJc8asZ3UnSmImR1BxX8bdbp18rBedgCOUT2uFSAfaqEOtXKBZ2i7Hk4Qb39
	aoP9p48lYHMNXWSQhX5NVnA8HEf46yZKuU9m2+Z60Xwwx289KKblsLtCcm+8Tw==
ARC-Authentication-Results: i=1;
	rspamd-5b468d8b77-b49wv;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Arithmetic-Soft: 65da47ab268e88ae_1727737320645_3666780444
X-MC-Loop-Signature: 1727737320645:2171171602
X-MC-Ingress-Time: 1727737320645
Received: from pdx1-sub0-mail-a315.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.112.95.152 (trex/7.0.2);
	Mon, 30 Sep 2024 23:02:00 +0000
Received: from offworld (unknown [104.36.31.106])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a315.dreamhost.com (Postfix) with ESMTPSA id 4XHc5g3BpWz2J;
	Mon, 30 Sep 2024 16:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1727737320;
	bh=UZjevEb+aS9Z63T3PhLuFwnTl0m/XfMMUJJ9gK77NXk=;
	h=Date:From:To:Subject:Content-Type;
	b=aJ66WVtF5wadplucglcPzJTORrapS6eiZLyCsEngTYvMz+nBtMQoNKpasMjVPzM6i
	 Wttxf1Q5Q6RXv381nD/ai2/g72lHZpMyJMe50DdyheTAinmfL7cyMLTVQL4er/2WxY
	 gPK0z8nx8xUWqxo/0vREjwNRPOQ8LURXUSzS3hYjH5RmKKrLinXidPBpLQHtTeB6v2
	 AOGYuVmXJul9LcVI3bsGtEc9AMiXhCl9ltBiwdfHicMj8j58Ay7V4trpupd53cYnCI
	 zhEYROi6hDS2QbzsQNi5LrKByKYi2qqsoe7NPj4FgUU1KIEniTMJJJZWctoNeVg/FC
	 33IUFFM4Lwtdg==
Date: Mon, 30 Sep 2024 16:00:32 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Matthew Wilcox <willy@infradead.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Christian Theune <ct@flyingcircus.io>, 
	Dave Chinner <david@fromorbit.com>, Chris Mason <clm@meta.com>, Jens Axboe <axboe@kernel.dk>, 
	linux-mm@kvack.org, "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Dao <dqminh@cloudflare.com>, 
	regressions@lists.linux.dev, regressions@leemhuis.info
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large
 folios since Dec 2021 (any kernel from 6.1 upwards)
Message-ID: <ymp5wtjaup6tjlbc3kkt3xkit4q5bmbvasdvbcdxfc2l77zx47@xalqc57xkkyb>
Mail-Followup-To: Matthew Wilcox <willy@infradead.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Christian Theune <ct@flyingcircus.io>, 
	Dave Chinner <david@fromorbit.com>, Chris Mason <clm@meta.com>, Jens Axboe <axboe@kernel.dk>, 
	linux-mm@kvack.org, "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Dao <dqminh@cloudflare.com>, 
	regressions@lists.linux.dev, regressions@leemhuis.info
References: <CAHk-=wgQ_OeAaNMA7A=icuf66r7Atz1-NNs9Qk8O=2gEjd=qTw@mail.gmail.com>
 <E6728F3E-374A-4A86-A5F2-C67CCECD6F7D@flyingcircus.io>
 <CAHk-=wgtHDOxi+1uXo8gJcDKO7yjswQr5eMs0cgAB6=mp+yWxw@mail.gmail.com>
 <D49C9D27-7523-41C9-8B8D-82B2A7CBE97B@flyingcircus.io>
 <02121707-E630-4E7E-837B-8F53B4C28721@flyingcircus.io>
 <CAHk-=wj6YRm2fpYHjZxNfKCC_N+X=T=ay+69g7tJ2cnziYT8=g@mail.gmail.com>
 <295BE120-8BF4-41AE-A506-3D6B10965F2B@flyingcircus.io>
 <CAHk-=wgF3LV2wuOYvd+gqri7=ZHfHjKpwLbdYjUnZpo49Hh4tA@mail.gmail.com>
 <ZvsQmJM2q7zMf69e@casper.infradead.org>
 <cldkpg3wtz2ovbyh53verlcauhqla7x2bi5ru4qo3kf4ehbiwz@ou56y3qjr5cv>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <cldkpg3wtz2ovbyh53verlcauhqla7x2bi5ru4qo3kf4ehbiwz@ou56y3qjr5cv>
User-Agent: NeoMutt/20240425

On Mon, 30 Sep 2024, Davidlohr Bueso wrote:\n

>Also, the last sentence in the description would need to be dropped.

No never mind this, it is fine. I was mostly thinking about the pathological
unbounded scenario which is removed, but after re-reading the description
it is still valid.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014734;
	b=DlL8T+BP/XBueX/oyQ+b6JQH+LOM11YWq20dbf811LULQbe943fjuYPGknqfwuw+VpK3
	 mHQ2hr8qyMsqqBwTsLwfkXMvPBMzpsmfX1ifB24hnqTgNUZGtxGkpnN8kKPR9DYTwGpBN
	 Eow8hEOmBNe5GJH52qfe+AQkrvaYQz+qkLj6VE6uRga8mDnd9zYv62Q/uz2ZaQYCvx/n6
	 +w1pZ/yl34O84AdgBv8+o7iWrJL+XuJsJ6lqAwX/oviNMRGBsgoCT+ijtxr1mMaXNSz8c
	 v5dKKdU4dHA5PXYbPf9gU5CsPMpyWgPjMiXgdNN4UPqWnq72zzNAu6A+nH7AHWihOjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=lGTCUVwBVhHA0G6XFL+3+lxo/iNodYNJMNP7+hVT0qg=;
	b=Y+R0QwHecbzLvLWZgEBol+dsUMlORSe06tAbijK5ADsqjaKUzy6WVKNbkpoEAQeUymHC
	 qpsk2c3YX/jeH4AVg2ykoU4v1TbF7nOgSAyvXj4XAQ0R3U9AOawokzx2o71w2gREXvovJ
	 3XqvMqUjAhesClVTa6i2LtKo6KVeHVtup3PQCZNyk7/Enj6kAULeye+PUHNdfesBbN97F
	 EpfYvoHYmYQmvDDXqykKd3buGe6JuZ6AzBTKXm4O8vv9O0062MrKd+tTCesH7Neayqek5
	 ln/R11tslhBc/yh5jsyOFWiGlVyoVzRax23cEBbNrpAi677yEcBKn7WsJqHfHpSt4bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ij7N17z2;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3769E606A31D
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 11:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3769E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ij7N17z2
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e46e449e8so877369f8f.3
        for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 04:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793014733; x=1793619533; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lGTCUVwBVhHA0G6XFL+3+lxo/iNodYNJMNP7+hVT0qg=;
        b=Ij7N17z2qUH4x7+1lAp1j5tstZk6yQwOUtli+v49meUt/NgeBm0E4EhwRXmlg2vkEr
         X7QLDHDNHhhfbZNV4OQ4Tv9jsaxqmwL2JiA7JDEu5bQlChd7oScHBXQQvo8ka6up3xA9
         H1oswGf/dahOj5SyHk9HQSplZ03XQhFfPMm//NsRZaAhPzvssTvHJWRqJjAFVus+q1jv
         vNT9OlgM8deasXWULZTSntLSXQ1bMQd6dfvQ1YPSsOiM/RCHEZc9++Q6BKRrjuncN8W9
         cTjqoeNskA6Cwmzvsfb/qYhjww+oTkbkRi7fI5cp5wAOOr1nzzG+kGQWeMkUOpZtoWQY
         JBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014733; x=1793619533;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lGTCUVwBVhHA0G6XFL+3+lxo/iNodYNJMNP7+hVT0qg=;
        b=1iqeJdGHJ7JZu/FzuhvePbTOK7lsV6LSHHRbxTnLa9/85mLwp761iuPsUhgKdpe7mc
         u3ASDNdTPHq9B4uPKA5RAPktlDRoui9oiymqdaHSHQ0HtHiThMebsiF2ksSVeUaoSeAU
         SLt1SDYF2uAWYu/wyZG3FskEnb81YbmwmApdTQOuYzYpCnoss9qAdomisYi/acvaLm20
         g7aiKWXNIh5nTt7w6/YwzFu1fqb1w+IQasW6t4fSK2UfX40qB103reFFFmmZnkBf7Mtx
         Jy0JIR0sP1J/0mCx/qDvJRdN8Z5ohpe3ZgFlwwHqgOWFZuVJ+JVfMP/MpBC1wnzBDjKc
         JRWw==
X-Forwarded-Encrypted: i=1; AKwUvByq9mL0gnkX/TKstNtJwKY7agLYeRgRZJyji4u/TNdWqVytYhF8TnyIZTPsVEbgqb1YGIczi0Aeo+4F4Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYKfove5/0GRPSvxn/Ts6GFsYHpdGNJN013XeN9B4irBdK75VOiL
	aUqTI+vJvKzCI8hHtjxsEHkQeQaeVCo39kbYXDDZB0g2LfdaBKjlRbQvA6qHLw==
X-Gm-Gg: AYBFou1p3pbTCdvsE84DBAk10p/FilADHJs2NY5h3Ydw/3iqI6dPYwJBJxwd9aaIa4g
	op/+7ScERI+6hjrXlPd9Qhica8nMNNuZ7k3wqc218QPOcVVxxQAq+fU1ZoR0xr5RkvHBXyWeeRV
	kclpDrkyNnQ8XD/1FzqakmSXfadRjXlE1WTOyaqFwTz0r6uMSk+YueD2+sH+N12++60vCUqZC13
	ojYjSjXr7O32ii2zsmr/UOJ7eQeZfrYy5P5Fb+xL7iAoi146c/cwqPQCOh2s/qR/8xhF5S82aQn
	tioEBVFlQC0hagSIeMGjiGNSCFccZCxTxLb5/c/X89Gwvg1R9IKqje756DuuujH7FxZkZCNQ6EV
	U2Ch+psUyUD353lQ5obUFBbN/QNWgmyCNMkMt7+W2Fo/CZu8xamw4TpHV+Qkt5+tcJ21WSABaII
	5qUEAEQYrWHZXFIZTPfV7Epfx9Aci1LBOJtwpsNFmLbX8VkFjQIR5Nb1qPzeGQJ2fhGturU5qKy
	JIznc1++jhw1AOggcXJILOTbpADp2FKewXtsk0B3JmUL0nA5Ss++cI4Ig0Qv6U6
X-Received: by 2002:a5d:5d86:0:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-48e3eb9c7fdmr11109704f8f.57.1793014732636;
        Mon, 26 Oct 2026 04:38:52 -0700 (PDT)
Received: from foxbook (bgu81.neoplus.adsl.tpnet.pl. [83.28.84.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd49afsm16227058f8f.35.2026.10.26.04.38.51
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 26 Oct 2026 04:38:52 -0700 (PDT)
Date: Mon, 26 Oct 2026 12:38:47 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Dennis Wissel <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>,
 linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron
 M5 (3434:d068) at boot since v7.3
Message-ID: <20261026123847.365209e2.michal.pecio@gmail.com>
In-Reply-To: <20261026105139.6b86cb3c.michal.pecio@gmail.com>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
	<20261024203558.3181711-1-yiyu@yiyuzhou.io>
	<SrQQcLIwRWyg9PdEIpc0eg@dsine.de>
	<20261025111410.2c14fcef.michal.pecio@gmail.com>
	<7082e2e7-8d05-46b8-a26b-5b888a7a0545@linux.intel.com>
	<20261026105139.6b86cb3c.michal.pecio@gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Oct 2026 10:51:39 +0100, Michal Pecio wrote:
> On Mon, 26 Oct 2026 11:18:34 +0200, Mathias Nyman wrote:
> > So even if we give back all pending URBs and clear the
> > EP_DROP_PENDING flag we continue using the stale ring. We should
> > either either move dequeue pointer, set TRBs to no-op, or clear and
> > reinitialize whole ep0 ring at device reset.  
> 
> This may need to be fixed regardless, because EP_DROP_PENDING on EP0
> can result from xHCI "Error" aka USB3 "Inactive" state, which (AFAIU)
> may be cleared with warm reset, without reallocating the udev. That's
> the "existed since forever" issue I was thinking about.

4.6.11 isn't 100% explicit what happens if EP 0 is halted at Reset
Device, but generally it should "terminate any USB activity, abort
any pending events and transition to the Running state".

So just a Set TR Dequeue to current enqueue will probably work, but
I think this has never been tried before.

I see that xhci_discover_or_reset_device() clears EP_DROP_PENDING
even in case of Reset Device failure, which looks a little odd. We
probably wouldn't want to issue Set TR Deq in such case and don't
want to clear this flag without fixing the endpoint.

What was the reason for placing this loop after and not before
the command_cleanup label?

command_cleanup:
        for (i = 0; i < EP_CTX_PER_DEV; i++)
                virt_dev->eps[i].ep_state &= ~EP_DROP_PENDING;

        xhci_free_command(xhci, reset_device_cmd);
        return ret;
}

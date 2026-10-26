Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041014;
	b=em2mXKrbS7cJMzinL0xWskuqceavgINChGSi9YNBO2MU77seuntZn8mq+QMM3RucbFv0
	 baIVuEQzfAVlJQnrRBgVQHpnEi1e7YbThz5sNLoR5cK/eTKRCR6A9Ut1/QkjSLsYQK7cG
	 PW5bCyt2FHm8n0pXOQs2Hs2Sd1Yptgx9dsagCvyGdWjJX+S0vC+TMBF2vhc0ZbTHQ2M/q
	 BaabxeqWYI5EoDrGvlaSm1TnfgLBUzWQi+C8VVWsn4AOAFXwm8Dj6pNgp/oMW8qdY0lbv
	 5ubx42wDx55671T4Q5rER8ssWyeDBq8VnQcg38TvVrs/8r5SpoJVtF5eom4Tozuibrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=JVqMtBFMHOwzO9zLQ8YijBa8OnqMBR6c1nFkc71SUv4=;
	b=vu5rT5b7QobjkgVhqy6qxgJeXiTH/bmdk+VT/1MYUwzbagC7j5ZIon4eUbCh8uXomK/C
	 2nVqyL1vk9Bvwl8dFt5Clfkra1LUOnD4RRJC1aSKvL6HfOHuCGjYOBOBqwqVBqwbl3uDj
	 xy29kmIZxkKCptzTM7pX3nSNX0h87XXlgGjjx8cjyZJLXxVh//lSU8FckAbdVTDuLEOjj
	 dmKCXm8G3Qve1weDuD+1CN/VVFf4Ti1vzdPXRkWTf4kI6XpKd+21CVO84eyJJCRAKWOdY
	 cD/u5e2v3oga3NqU7yLrwQUL0dEXbFHojWn9BAB+9BwV3sMJcIS9NUVwYDhf0LPMXkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=BKAPXBdQ;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AEC606A31A
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 18:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0AEC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=BKAPXBdQ
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5363316fa0cso52124391cf.3
        for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 11:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793041013; x=1793645813; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JVqMtBFMHOwzO9zLQ8YijBa8OnqMBR6c1nFkc71SUv4=;
        b=BKAPXBdQfhi/Z47olDEWXfxzqvkbVuFqweZMOiC+eyM9mS8+izFn9yqpvcZJoxOtVe
         XKxOtIOTR2+v4fNUsvsvQ7vs6XgHh3Pyd1YI9jtn3RnO5FeQ9mO8TKLlCSx7q4HYcw/N
         EzVR3EAam8rRUfUTzlnBcTMgdAVvl39D5adp0Fp1VC3Gj/3CZW1L1MDKfyH57Sm+KlHP
         MuizGWyf3YIM84YVnpnW3QcxzHF6ACO7hnsY5+4OBTqXJQCvioGl75BsFeuAnnlcKFt+
         DaeDkGe8WbpDJ/s7IWW1N53cJJA+bovF6HdpIgiLsiLPU3vOlcDs+W7IbtjnHWU6cnJ8
         25tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041013; x=1793645813;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JVqMtBFMHOwzO9zLQ8YijBa8OnqMBR6c1nFkc71SUv4=;
        b=yltJHXoP5T0cP2/TI3h1TAfyLw4kkq4VpMwQP/gK+P9IpebyUoBdwBB7iR7DAoqqw9
         DquUtP3Eml270aaJlDmUCuC0TNp3NqGYrgEhdjO5f+VZLZoMo9dKrdVY7rpVibHTJMSc
         eAZ0El2pl3YBd7U13O2VniXIRM9dkVRrTbZYD8ZC0uDzu9u4lhXg0Wyf0t4LqHDCwn70
         UEf3uqWHT39dliTCpJO/+TJMMWi3vhCkHwQVAy1aM2LAUr5gkLr+PEoKuwlD/f5vuvVI
         5EDHVsxpFcV+jWT2k9O1jOBX0IN4ovOGEAKiprPwioh1l4nZOqemVT1szxGkUy6njPBC
         eZ1g==
X-Forwarded-Encrypted: i=1; AKwUvByGYgRb2e4g1c37HaOT7PJ5mDPge4ru7GeDkgAhO1XEh9dV3g2mpHQlPfoClUx1jDNTYdNSFo4q0x0hMg==@lists.linux.dev
X-Gm-Message-State: AFq9FYK9yq7zY8ROOKA3+6v3QP4p0+zoceMWGPF9MlXOk8NnzErIqt/B
	KOgwdJYUhKRudvePnWBQ94ZQ2xOh5VcqYKIO4k8JSFc5iU0Y+nLeU/Zp4B8r7QrbG4yAKl2DgQr
	lSrB5gw==
X-Gm-Gg: AYBFou1tRyYN8hvF21EEDRwQ8738B8EYQ6qpfhDLY0RMgkp+5yNSPXF7IJT/27Pyrkj
	yCajxoyBkmfUPSu4ttqH4RARsjvuRjNKlzGF6yMiGLMbfdehhDETHcQnRSheORoWPD4CS3Q9Jye
	/NrIWhD7HbfMkKKLtyBq+mCZQSx2EZk1EkCQHLONysd0/beupxrplKmdUCmMvj/yxWJsxlG4Je+
	LiY6r5MZ+hxOML5mfvBTgU3c2W76aoGLsNl/c9MYfOch6pzbCs1lC9rPeSlGd6sOPvKSkTVs64Q
	hMmlVRPZLv+emc9YTL2J8zk42j5erZX8wf9QviXT01DkjwZ0vChCy6pFCQLCJc/upaS1gcB+TAi
	zonUA04pbUxDmkegGt3cnri6il6g0n6mMqhSSpmwAjFx4aYencB0eS+LqFkLZXrWdC83XlECFms
	SCadP8rEU4PnqwYlsS8KwAtVhWPO9gabU+n8BPcU8KoKxzTyPwf3GeNVrQKA6rhAS1IjkOEPrik
	25gYhbRrKpMhTqqeMRkcGY9FZXMEYJdzxBlG/i7ydsw6oCgRRRCHgV0GwBmgH/JXxX5f/xjjYMc
	ww+rhLlhyU9RkDExl6fOTK46SfhgiZMa7fA67xjH5uaqiSYIuUJOmUdTlcww9BlBdI+FEz4i
X-Received: by 2002:a05:620a:372c:b0:93c:a191:88fe with SMTP id af79cd13be357-940ef79eed3mr1080853885a.8.1793041012521;
        Mon, 26 Oct 2026 11:56:52 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c54cbdsm79943376d6.26.2026.10.26.11.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:56:52 -0700 (PDT)
Date: Mon, 26 Oct 2026 14:56:49 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Dennis Wissel <dennis@dsine.de>, Yiyu Zhou <yiyu@yiyuzhou.io>,
	linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron M5
 (3434:d068) at boot since v7.3
Message-ID: <3ddd9334-6dee-48cf-8a62-82cebbe51d7f@rowland.harvard.edu>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026105139.6b86cb3c.michal.pecio@gmail.com>

On Mon, Oct 26, 2026 at 10:51:39AM +0100, Michal Pecio wrote:
> On Mon, 26 Oct 2026 11:18:34 +0200, Mathias Nyman wrote:
> > > But is USB core really resetting a device for which the hub has
> > > reported disconnection? Something isn't as I would expect.  
> > 
> > I suspect udev, xhci virt_dev, and thus xhci ep0 ring stays intact
> > even if device has a short disconnect during reset/enumeration.
> 
> But this doesn't make sense, right? If the port reports connect state
> change, we have no idea if it's still the same device or not, I would
> expect udev to be discarded. Or is this some "USB persist" magic?
> 
> I didn't want to dig into the hub driver or bother Alan, I hope we will
> get that debug log showing what usbcore is doing there.

You can read the login in hub.c:hub_port_connect_change().

Broadly speaking, if the port is enabled after a connect-change event, 
the core tries to resuscitate the child device (and checks whether the 
descriptors have changed).  Also, if the child device was suspended when 
the connect change occurred, the core will try to resuscitate it by 
treating the change as a wakeup event.

Alan Stern

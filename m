Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F327468E
	for <regressions@lists.linux.dev>; Mon,  5 Sep 2022 17:15:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9A553353D3;
	Mon,  5 Sep 2022 17:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1662398111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lqcIPRczxfdWmkZO56Kcs83+FDpNphXjP0tEpVlr5po=;
	b=x/qpakKfGis4g+seQSubpFaqRmZYGSO69JFx5LcL+8e1bA+POzNT+ZAm3lWgQOg5HcQQ7z
	tsBaKRplXdJW2Z2rvhl4xT1Kbh5FvuJcSiat/SjPt3K0/rhmGBLFLS/EtOoTtIQkeqWQJl
	BI0C4tGCi71oRrdP6x3TYHsciKUeIQU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1662398111;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lqcIPRczxfdWmkZO56Kcs83+FDpNphXjP0tEpVlr5po=;
	b=5n8cy8fiULoFLurr1YhFj0CmLdG2cB88tvq8HFeT8/nqYOJX9BVUnYWW4LxdLopLCSPtQI
	d0zB+kj8Lcjlx7CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4111113A66;
	Mon,  5 Sep 2022 17:15:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ZnYLDZ8uFmOLCQAAMHmgww
	(envelope-from <lhenriques@suse.de>); Mon, 05 Sep 2022 17:15:11 +0000
Received: from localhost (brahms.olymp [local])
	by brahms.olymp (OpenSMTPD) with ESMTPA id 09434c0c;
	Mon, 5 Sep 2022 17:16:00 +0000 (UTC)
Date: Mon, 5 Sep 2022 18:16:00 +0100
From: =?iso-8859-1?Q?Lu=EDs?= Henriques <lhenriques@suse.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	linux-wireless <linux-wireless@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: New 6.1 net/mac80211/rx.c warning with iwlwifi / Ultimate-N 6300
 wifi
Message-ID: <YxYu0CawomVcTlRn@suse.de>
References: <498d714c-76be-9d04-26db-a1206878de5e@redhat.com>
 <YwNNXKEFcX/GK2Sv@suse.de>
 <644e506ab60a58b95bdbbb5d9c3e425622931f8f.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <644e506ab60a58b95bdbbb5d9c3e425622931f8f.camel@sipsolutions.net>

On Mon, Aug 22, 2022 at 12:21:49PM +0200, Johannes Berg wrote:
> On Mon, 2022-08-22 at 10:33 +0100, Luís Henriques wrote:
> > On Sat, Aug 20, 2022 at 03:12:33PM +0200, Hans de Goede wrote:
> > > Hi All,
> > > 
> > > While testing 6.0-rc1 on a Dell Latitude E6430 with:
> > > 
> > > 03:00.0 Network controller: Intel Corporation Centrino Ultimate-N 6300 (rev 35)
> > > 
> > 
> > I've just seem a similar splat on -rc2, with a different card:
> > 
> > 02:00.0 Network controller: Intel Corporation Wireless 8260 (rev 3a)
> > 
> 
> Yeah this is an issue with the new multi-link work.
> 
> We've seen it too, though the rx->link _should_ be set to deflink here
> in the cases of non-MLO connections.
> 
> We're investigating.

FWIW I'm still seeing this with RC4.

Cheers,
--
Luís

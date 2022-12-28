Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E656D24
	for <regressions@lists.linux.dev>; Wed, 28 Dec 2022 20:24:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BBA5C21A21;
	Wed, 28 Dec 2022 20:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1672259084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PNZQeMoVy7KGBZd3TY/hjBMsT8Wahi2q2P3jL0HXUCM=;
	b=tM2qJZhfi+SXzV27m5JEZd9GV5wClY52zAhFoccQlN8dpIzzvNouvfILmLE8cQzFBjYvVM
	Up8RcjucQd8KQncfBVF95Rg7GDne7MDMkFzQrY7GZqjh3YsvAq3svw8ba8J0AJSonHr6nO
	/18RRjOBU7cGfGUGEH/FzUPKCKsWyxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1672259084;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PNZQeMoVy7KGBZd3TY/hjBMsT8Wahi2q2P3jL0HXUCM=;
	b=FXKd3ScYdOkNc6F3uKQe/h4ql4UCQ6G+bOr0MMaKzWX4QuYZRE2kDI+6DyTGkmuOehsMUE
	pbMZ/jPF58AUBODw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6F496134F5;
	Wed, 28 Dec 2022 20:24:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 6y7VGQymrGNrRQAAMHmgww
	(envelope-from <vbabka@suse.cz>); Wed, 28 Dec 2022 20:24:44 +0000
Message-ID: <7cbe96cf-e0b5-ba63-d1b4-f63d2e826efa@suse.cz>
Date: Wed, 28 Dec 2022 21:22:56 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
From: Vlastimil Babka <vbabka@suse.cz>
Subject: [REGRESSION] suspend to ram fails in 6.2-rc1 due to tpm errors
To: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jan Dabros <jsd@semihalf.com>
Cc: regressions@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
 linux-integrity@vger.kernel.org,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Ugh, while the problem [1] was fixed in 6.1, it's now happening again on
the T460 with 6.2-rc1. Except I didn't see any oops message or
"tpm_try_transmit" error this time. The first indication of a problem is
this during a resume from suspend to ram:

tpm tpm0: A TPM error (28) occurred continue selftest

and then periodically 

tpm tpm0: A TPM error (28) occurred attempting get random

and further suspend to ram attempts fail:

tpm tpm0: Error (28) sending savestate before suspend
tpm_tis 00:08: PM: __pnp_bus_suspend(): tpm_pm_suspend+0x0/0x80 returns 28
tpm_tis 00:08: PM: dpm_run_callback(): pnp_bus_suspend+0x0/0x10 returns 28
tpm_tis 00:08: PM: failed to suspend: error 28
PM: Some devices failed to suspend, or early wake event detected

Unfortunately I doubt I would be able to bisect it as any "good" kernel might
be a false negative.

[1] https://lore.kernel.org/all/c5ba47ef-393f-1fba-30bd-1230d1b4b592@suse.cz/

#regzbot introduced: v6.1..v6.2-rc1

Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A922CA6
	for <regressions@lists.linux.dev>; Tue, 14 Mar 2023 00:06:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B2F19229D2;
	Tue, 14 Mar 2023 00:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1678752391; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IPlAhnHZI1/4kHDq0dvU4vpeu5ilx6uAt/un6KbOR/s=;
	b=nRdCMirlRiU+GSor//GA1fKYBhQAGJJ05d6LvtCuznLaMnPHwNfzIp/cQVXaLTuqi04vjG
	AspOnM1iNVObgSwv6CJJCnZvSHsNSiBgYKFSMFXYvpNGBCiIndwzgcvvKkUkVk/Zuw7UjV
	x/0Ct9VhL7pYbnBtbu81zEDi2F5cjIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1678752391;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IPlAhnHZI1/4kHDq0dvU4vpeu5ilx6uAt/un6KbOR/s=;
	b=QB8GmDsmLLVzTdUVS6UkHXLoaDRFha5HvjKOIXSDq8tgrkBdygpmgcUgGZCTHtk3Sm+Frn
	/0pDHH9mJlG6xfCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6481613A1B;
	Tue, 14 Mar 2023 00:06:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id wsN0B4W6D2SOagAAMHmgww
	(envelope-from <neilb@suse.de>); Tue, 14 Mar 2023 00:06:29 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
Cc: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>,
 "Song Liu" <song@kernel.org>,
 "Linux regressions mailing list" <regressions@lists.linux.dev>,
 "linux-raid" <linux-raid@vger.kernel.org>,
 "LKML" <linux-kernel@vger.kernel.org>,
 "Nikolay Kichukov" <hijacker@oldum.net>
To: Jes Sorensen <jes@trained-monkey.org>
Subject: [PATCH - mdadm] mdopen: always try create_named_array()
Date: Tue, 14 Mar 2023 11:06:25 +1100
Message-id: <167875238571.8008.9808655454439667586@noble.neil.brown.name>


mdopen() will use create_named_array() to ask the kernel to create the
given md array, but only if it is given a number or name.
If it is NOT given a name and is required to choose one itself using
find_free_devnm() it does NOT use create_named_array().

On kernels with CONFIG_BLOCK_LEGACY_AUTOLOAD not set, this can result in
failure to assemble an array.  This can particularly seen when the
"name" of the array begins with a host name different to the name of the
host running the command.

So add the missing call to create_named_array().

Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217074
Signed-off-by: NeilBrown <neilb@suse.de>
---
 mdopen.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mdopen.c b/mdopen.c
index d18c931996d2..810f79a3d19a 100644
--- a/mdopen.c
+++ b/mdopen.c
@@ -370,6 +370,7 @@ int create_mddev(char *dev, char *name, int autof, int tr=
ustworthy,
 		}
 		if (block_udev)
 			udev_block(devnm);
+		create_named_array(devnm);
 	}
=20
 	sprintf(devname, "/dev/%s", devnm);
--=20
2.39.2


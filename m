Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ABE7B;
	Sat, 11 Mar 2023 14:19:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 8F0B742625;
	Sat, 11 Mar 2023 14:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1678544382; bh=K9gl8fahgYUMVFftdPQMDoNmStusBGDJI/NXoxPhu6o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=tDGxqR5NqPgL2zB++YbolTcp9fLpui6CI9QgypZYnAKvKSPFLGWtT5J8uq7Fp0cr3
	 2K8k2vlMH9b80XRTWwJ3MHYk7rafN7T9fLGJYUrG7NcnUaUi7Kccjiwwa5wxqrpN3g
	 EzwZ58hpqwF3JxIt7H6OSIdw5IT1GGTP6P/mcHcPS5sNwWwOJtL882tKe36RolVUnB
	 JIBwRQMVVi0NlPeKnDi86DAfxI8YgPoazmmcQGTReFc4IMRAOaLAjewdNRk87w/W3y
	 PvSTaM7mRJNKhskVL7D94KA+yKBAgTqcgmETBylstCjSfDl3JQLfxcTUZbRx1UpO+7
	 uOsNT2wDRfcGg==
From: Hector Martin <marcan@marcan.st>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Alexander Wetzel <alexander@wetzel-home.de>
Cc: Ilya <me@0upti.me>,
	Janne Grunau <j@jannau.net>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	regressions@lists.linux.dev,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>
Subject: [PATCH] wifi: cfg80211: Partial revert "wifi: cfg80211: Fix use after free for wext"
Date: Sat, 11 Mar 2023 23:19:14 +0900
Message-Id: <20230311141914.24444-1-marcan@marcan.st>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <d6851c2b-7966-6cb4-a51c-7268c60e0a86@marcan.st>
References: <d6851c2b-7966-6cb4-a51c-7268c60e0a86@marcan.st>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts part of commit 015b8cc5e7c4 ("wifi: cfg80211: Fix use after
free for wext")

This commit broke WPA offload by unconditionally clearing the crypto
modes for non-WEP connections. Drop that part of the patch.

Fixes: 015b8cc5e7c4 ("wifi: cfg80211: Fix use after free for wext")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/linux-wireless/ZAx0TWRBlGfv7pNl@kroah.com/T/#m11e6e0915ab8fa19ce8bc9695ab288c0fe018edf
Signed-off-by: Hector Martin <marcan@marcan.st>
---
 net/wireless/sme.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/net/wireless/sme.c b/net/wireless/sme.c
index 28ce13840a88..7bdeb8eea92d 100644
--- a/net/wireless/sme.c
+++ b/net/wireless/sme.c
@@ -1500,8 +1500,6 @@ int cfg80211_connect(struct cfg80211_registered_device *rdev,
 		connect->key = NULL;
 		connect->key_len = 0;
 		connect->key_idx = 0;
-		connect->crypto.cipher_group = 0;
-		connect->crypto.n_ciphers_pairwise = 0;
 	}

 	wdev->connect_keys = connkeys;
--
2.35.1


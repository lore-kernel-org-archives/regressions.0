Received: from air.basealt.ru (air.basealt.ru [194.107.17.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BC97E
	for <regressions@lists.linux.dev>; Fri, 30 Dec 2022 09:42:24 +0000 (UTC)
Received: by air.basealt.ru (Postfix, from userid 490)
	id B8C182F20236; Fri, 30 Dec 2022 09:35:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on
	sa.local.altlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.1
Received: from nickel-ws.ipa.basealt.ru (unknown [85.140.7.15])
	by air.basealt.ru (Postfix) with ESMTPSA id D082C2F20226;
	Fri, 30 Dec 2022 09:35:48 +0000 (UTC)
From: nickel@altlinux.org
To: linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	regressions@lists.linux.dev
Subject: [PATCH 0/1] Revert patch to fix sound sudden dissapearance
Date: Fri, 30 Dec 2022 12:30:52 +0300
Message-Id: <20221230093454.468857-1-nickel@altlinux.org>
X-Mailer: git-send-email 2.33.5
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update to 5.10.157 causes sudden sound dissapearance regression for some laptops

[PATCH 1/1] Revert "ASoC: soc-pcm: Don't zero TDM masks in

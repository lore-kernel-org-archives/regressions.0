Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0750C20683
	for <regressions@lists.linux.dev>; Tue, 30 May 2023 19:28:54 +0000 (UTC)
Received: from cwcc.thunk.org (pool-173-48-120-46.bstnma.fios.verizon.net [173.48.120.46])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 34UJQcSF011212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 May 2023 15:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1685474799; bh=IUUh7klqJKZF8dQtCWpOWUVn9wGRdkI53waGlT6vlNU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=d3lor2M10nL2H3xE+OM5L7Gn9siytcp03q6NImL0ijPhEdSalVk0PMFvH5AIqtG1u
	 UClu/VkkcXnM/yN1Ht8IxM3yMuHuYS0CaTGXVIymloYnaG0o5K1b1MZ8bSJeM0iJv8
	 VUFAWfrCE+sUnpR7SU/TqBavOYI2ik/k+h/ahnGmCcE0DzsiYGEnJ1iyFYo+gnUwoy
	 pC+ZhshOpGJHDx1ouWfm3RYkjJ8xJkJy2SVFcaUnJWrd+XER5Kdx1gpKyXUjmvqYqY
	 +vLKf23alNDTkHhwi8AGt7jVUWhkhgOhKmBjlkXW3gZ7zt9uK03UI6ivoZ33hcMP0e
	 aRllJMWrGTKJg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id DA7A015C02EE; Tue, 30 May 2023 15:26:37 -0400 (EDT)
From: "Theodore Ts'o" <tytso@mit.edu>
To: Jan Kara <jack@suse.cz>
Cc: "Theodore Ts'o" <tytso@mit.edu>, linux-ext4@vger.kernel.org,
        Eric Whitney <enwlinux@gmail.com>,
        Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH] ext4: Fix fsync for non-directories
Date: Tue, 30 May 2023 15:26:34 -0400
Message-Id: <168547476046.200310.8139638693593712041.b4-ty@mit.edu>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230524104453.8734-1-jack@suse.cz>
References: <20230524104453.8734-1-jack@suse.cz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 24 May 2023 12:44:53 +0200, Jan Kara wrote:
> Commit e360c6ed7274 ("ext4: Drop special handling of journalled data
> from ext4_sync_file()") simplified ext4_sync_file() by dropping special
> handling of journalled data mode as it was not needed anymore. However
> that branch was also used for directories and symlinks and since the
> fastcommit code does not track metadata changes to non-regular files, the
> change has caused e.g. fsync(2) on directories to not commit transaction
> as it should. Fix the problem by adding handling for non-regular files.
> 
> [...]

Applied, thanks!

[1/1] ext4: Fix fsync for non-directories
      commit: 47a71ba09a8473c81cb87ed11421ed2896f352d2

Best regards,
-- 
Theodore Ts'o <tytso@mit.edu>

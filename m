Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572D52046AA;
	Mon,  7 Apr 2025 15:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040901; cv=none; b=CButkm4GdCeryILRPb1aIinQsjT85gFNii6Sg2Tx1N+WQVkiPPtH6fv1wjATTxDRcXqjIxGqJHvZfpzDP4TBxhfTBdhrqR1deSkPCpd3d15Zr1BGUoc+k/EoANVht5qj8OdcJkHmdSyZ8pl9Bcxupw91uaO2V3KbqZVtZx69T5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040901; c=relaxed/simple;
	bh=0xZHHNwv3RIwMon1qNVJ/iIZQy46OVS+Hb6QNCUTxw8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=WokxjWxcRiCJAEUhwiL0zVhL2S8NhhBerrYirJWavpXocH2sBy33+b9Web+rOtkPQjn0lfg+ferC/3ttf5c8eJRyjCWclgedFYsL4DswSJ2jws+HULdPlSlV85i+kTW1V0A7QxsS1SZ64s9ZdgdVsY28jXEMPWZjryvuIj71KOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HpHR4CG0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HpHR4CG0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF859C4CEDD;
	Mon,  7 Apr 2025 15:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744040901;
	bh=0xZHHNwv3RIwMon1qNVJ/iIZQy46OVS+Hb6QNCUTxw8=;
	h=Date:To:Cc:From:Subject:From;
	b=HpHR4CG0qbzHp1H06ZEFpYZlEc0NeIzKlUAoAtDUUANGJ/pZDm0alh/ONUMEArczS
	 meWzHq/LJmRGPzb+lPeo9Tep0ZmzLd/46TqswjcyE5VCovbhFbtaCJti5+FmUFK4Nm
	 /8aLk4pde9Qin2uacuytXNq+TyGBsP9xSQSBWL0T74H6mvT0O1yW0JOftKwgRjor9a
	 Lkd+R5HigEt0sjA4Qp3G2C92wng0GW6D5Vg7OgG2GqqVihkECc2GQWUYj8gk9THwnb
	 pOCzr2uj+UMgEEERXqZQk75boDLv0pRarsUESngHUHGw8Kn6b/GK1pVNm/j+OUOqol
	 srAz3LCOZxteA==
Message-ID: <0cfeab74-9197-4709-8620-78df7875cc9b@kernel.org>
Date: Mon, 7 Apr 2025 10:48:19 -0500
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux kernel regressions list <regressions@lists.linux.dev>,
 David Howells <dhowells@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org,
 yaneti@declera.com
From: Mario Limonciello <superm1@kernel.org>
Subject: distrobox / podman / toolbox not working anymore with 6.15-rc1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

With upgrading to 6.15-rc1, the tools in the subject have stopped 
working [1].  The following error is encountered when trying to enter a 
container (reproduced using distrobox)

crun: chown /dev/pts/0: Operation not permitted: OCI permission denied

This has been root caused to:

commit cc0876f817d6d ("vfs: Convert devpts to use the new mount API")

Reverting this commit locally fixes the issue.

Link: https://github.com/89luca89/distrobox/issues/1722 [1]

Thanks,

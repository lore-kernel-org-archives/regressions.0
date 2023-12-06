Received: from dianne.skoll.ca (dianne.skoll.ca [144.217.161.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8654947F69
	for <regressions@lists.linux.dev>; Wed,  6 Dec 2023 22:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=skoll.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=skoll.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=skoll.ca header.i=@skoll.ca header.b="Im+oaxws"
Received: from pi4.skoll.ca ([192.168.84.18])
	by dianne.skoll.ca (8.17.1.9/8.17.1.9/Debian-2) with ESMTP id 3B6MMLPA150301;
	Wed, 6 Dec 2023 17:22:21 -0500
Received: from gato.skoll.ca (gato.skoll.ca [192.168.83.21])
	by pi4.skoll.ca (Postfix) with ESMTPS id 4SlsMw6MLzzgd526;
	Wed,  6 Dec 2023 17:22:20 -0500 (EST)
Date: Wed, 6 Dec 2023 17:22:20 -0500
From: Dianne Skoll <dianne@skoll.ca>
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Subject: Regression: Radeon video card does not work with 6.6.4; works fine
 with 6.6.3
Message-ID: <20231206172220.37ff4df9@gato.skoll.ca>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skoll.ca; h=date
	:from:to:cc:subject:message-id:mime-version:content-type
	:content-transfer-encoding; s=canit2; bh=X8/H0YQ8bBMIujNIYJC8/g8
	7XEoEBQ/bCEH1iwpOx0g=; b=Im+oaxwsqCTcMD/cP9hOU8cmaeZwryBnCsw9TAm
	jk0cxBUMksvsP6EESILhKoL3bgC1gCuei0IIT2dQTf6yjI/tled2A4PbiVjk/Icc
	HPQosA9rz3xBRHO3d+Y7XzTdQ4FPVo71fDPQv2QnjSBXWuak2gIGFDaMWHhd0aR8
	MDOWnxOg5RD/zxOj9+PyYRWTNqPUWF1YdaOT03vmrcW8Be+FTBN9sAzybyHi3a9y
	IehC74XL8+X4beqiMOdhk37uLU2hsRE9nkZZWx5d0aMIMkqgdFtsSuLMSbyQA7Dc
	+4G5W5Q3JrV4LG/Q+ekWigA1pdmMI/9v+WBwuc6QiPxWqug==
X-Scanned-By: CanIt (www . roaringpenguin . com)
X-Scanned-By: mailmunge 3.12 on 192.168.83.18
X-Spam-Score: undef - relay 192.168.84.18 marked with skip_spam_scan
X-CanIt-Geo: No geolocation information available for 192.168.84.18
X-CanItPRO-Stream: outbound (inherits from default)
X-Canit-Stats-ID: Bayes signature not available
X-CanIt-Archive-Cluster: tWKWaF/NcZkqjWIj0BEJTBHJhwY
X-CanIt-Archived-As: base/20231206 / 01bjaml1b

Hi,

I had to go back to 6.6.3 because 6.6.4 seems to have broken my Radeon
video setup.  The full bug report:
https://bugzilla.kernel.org/show_bug.cgi?id=218238

Regards,

Dianne.

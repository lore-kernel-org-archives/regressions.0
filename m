Received: from e234-61.smtp-out.ap-northeast-1.amazonses.com (e234-61.smtp-out.ap-northeast-1.amazonses.com [23.251.234.61])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CCC3D34AD
	for <regressions@lists.linux.dev>; Fri,  6 Mar 2026 18:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.234.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772820643; cv=none; b=lTRkTWYzUd+ycMsY+M+rPg8cRJ8YYzcCL0lxw4f9EJn8fRixiBDWiWbIYRIG6zUPLvBLpnAcNVAK06NGCeRdKZtk9jsW1Fmq6TcsHTf9UGneuxvaIBZOERVUD1S6sQ1MxvRyyKZQAc1iGJLo+AoajpAvR/yT3owei+ofWr6tnqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772820643; c=relaxed/simple;
	bh=KVLNn2ax+asM2yDOQBLsW9QcrFqP0O4tRwB/n0oWb9o=;
	h=From:To:Cc:Subject:Message-ID:Date:MIME-Version:Content-Type; b=rom+T5EQIHq+VmJ5xUvo9xBP4Iow+R1aZ0wHyDu1pXFnzaN3fjM0fk0RWij52ok0ZoS/Ff8O1CZFGZLQQVNQ0VYQmxYbBRLevq+nfFYmtmsBzTOw1ihdspf96sjtmK6v96n4nWyA4z2sXRKqDlYsOZYuN1sr2xOVj2zafh8BumY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgml.me; spf=pass smtp.mailfrom=send.mgml.me; dkim=pass (1024-bit key) header.d=mgml.me header.i=@mgml.me header.b=PgYiYB2A; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=JsPNbVlW; arc=none smtp.client-ip=23.251.234.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgml.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.mgml.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mgml.me header.i=@mgml.me header.b="PgYiYB2A";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="JsPNbVlW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=mgml.me; t=1772820640;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=KVLNn2ax+asM2yDOQBLsW9QcrFqP0O4tRwB/n0oWb9o=;
	b=PgYiYB2AcpXGBbgGWROM32CKUrpavFKTpq3eJl7jVp7O+C8Q1ckluInjneOi+zjJ
	jOMakibhONk90Sm8/1X13+BF3eLZMpwjLBitd8cmCJTi935drqtSn7D0Elr4FOnPVlE
	6FDjtf7JSzki/XYnO7OutzYEcTIPPUC9LO4VIySM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=suwteswkahkjx5z3rgaujjw4zqymtlt2; d=amazonses.com; t=1772820640;
	h=From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=KVLNn2ax+asM2yDOQBLsW9QcrFqP0O4tRwB/n0oWb9o=;
	b=JsPNbVlW+Nnw+tUyJUeNVRHjTzzFi22hlQimb3NmFV3F5Jhv0ZmP5Gj436OTOpXK
	ggZuzsv4fKIc3QFLF9+T/fgV8CsdAomofLIR3GhYNMEUuDzhl2g1e0ePcjUVxKm74mp
	AuhG45GZi2QzR4PAPsBwBkH60gc0k7ZFeMNEXo8U=
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Kenta Akagi <k@mgml.me>
To: regressions@lists.linux.dev
Cc: stable@vger.kernel.org, sashal@kernel.org
Subject: [REGRESSION] 6.6.129 tools/perf cannot build due to eddddf4ed7f6
Message-ID: <0106019cc4583222-d98c40c9-2728-4d21-85b7-a90135726b95-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 6 Mar 2026 18:10:40 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.SskAFE1oaJ7KCjyyJFCV37nkSRmUZttpeGoevLE2CszduPSq19CK0OWqrkMmPMemkYWmFvQfvS6+lCR9ETv8vDWvEFaQZtUQ69n4DuGGNbGH4U7i+CnKWCHWm/HpilUFxPcCpCRFiQTHPHnKlfimqanQj7AjyJ2y8XQuaQGs83Sl+MS5tJ/lS6+Uh2zwyhRo:1.ap-northeast-1.TOS0vxEE3Ar6ai29fkp2i/jb+l2iigajCGeLfF7S3sk=:AmazonSES
X-SES-Outgoing: 2026.03.06-23.251.234.61

Hi,

It seems that build of tools/perf fails due to commit=20
eddddf4ed7f6 ("perf unwind-libdw: Fix invalid reference counts") backported=
 in v6.6.128.

util/unwind-libdw.c: In function =E2=80=98unwind__get_entrie=
s=E2=80=99:
util/unwind-libdw.c:323:17: error: implicit declaration of =
function =E2=80=98map_symbol__exit=E2=80=99; did you mean =
=E2=80=98symbol__exit=E2=80=99? [-Wimplicit-function-declaration]
  323 |                 map_symbol__exit(&ui->entries[i].ms);
      |                 ^~~~~~~~~~~~~~~~
      |                 =
symbol__exit

This backport adds a call to map_symbol__exit, but =
upstream=20
commit 56e144fe9826 ("perf mem_info: Add and use =
map_symbol__exit and addr_map_symbol__exit"),=20
which added this function,=
 has not been backported to v6.6.

I was able to build it by simply =
reverting eddddf4ed7f6, but I haven't tested perf though...

Thanks,
Akagi
